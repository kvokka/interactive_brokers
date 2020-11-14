# frozen_string_literal: true

require_relative "application_controller"

class AbstractActionController < ApplicationController
  class << self
    # Should be overwritten
    # @return Registry
    def registry
      raise NotImplementedError, "replace with Registry instance"
    end

    # Produce arguments converter for this action
    # Storing all the convertors on the class level helps to calculate them only once
    def converter(action_name)
      return @converter[action_name] if defined? @converter

      @converter ||= Hash.new do |hash, key|
        hash[key] = InteractiveBrokersProxy::JavaMethodDynamicConverter.new(action_name)
      end
      @converter[action_name]
    end

    # All supported methods are stored in +InteractiveBrokersProxy.supported_methods_registry+
    # for easier access
    def inject_in_supported_methods_registry(action_name)
      InteractiveBrokersProxy.supported_methods_registry[registry.name] << action_name
    end

    # Creates http action for java api method
    def create_action(action_name)
      inject_in_supported_methods_registry(action_name)
      post("/#{action_name}", provides: default_content_type) do
        self.action_name = action_name
        settings.registry.register(registry_key, new_channel).tap do |channel|
          settings.converter(action_name).invoke_java_method(*api_action_args)
          body channel
        end
      end
    end
  end

  attr_accessor :action_name

  # Creates channel with a callback, which should clean up the registry after body processing
  # (only in case that in the registry is the same channel)
  #
  # Also this channel contains a timeout check in case of an error
  # Because of design of Interactive Brokers gateway we are not able to detect an error in case that
  # there is some thing wrong with our request (all errors are just pushed in errors callback/action)
  # so the best we can do is just close the channel by the timeout
  #
  # TODO: Move it to it's own factory, if it will grow
  #
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Lint/Void
  def new_channel(timeout: settings.default_timeout)
    Concurrent::StreamingChannel.new(capacity: settings.default_channel_capacity).tap do |channel|
      Concurrent::Channel.go(channel) do |chan|
        ~Concurrent::Channel.timer(timeout)
        next if chan.started?

        settings.logger.debug "Callback for #{self} was terminated by timeout: #{timeout}s"
        chan << JSON.dump({ error: { from: :app, message: "terminated callback" }.merge(to_h) })
        chan.close
      end
      channel.after_each_callbacks << lambda { |chan|
        settings.logger.debug "After each callback for #{self}"
        settings.registry.unregister(registry_key, chan)
      }
    end
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Lint/Void

  # arguments from the current request instance
  def api_action_args
    @api_action_args ||= begin
      request.body.rewind
      settings.json_encoder.load(request.body.read) || []
    end
  end

  # the way how we calculate the current request registry key
  def registry_key
    raise NotImplementedError
  end

  def to_h
    { action: action_name,
      registry: settings.registry.name,
      registry_key: registry_key }
  end

  def to_s
    to_h.map { |k, v| "#{k}: #{v.inspect}" }.join(", ")
  end
end
