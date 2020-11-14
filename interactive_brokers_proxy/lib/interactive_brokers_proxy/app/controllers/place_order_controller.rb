# frozen_string_literal: true

require_relative "abstract_action_controller"

# Order controller is special cos it use it's own ID's registry
# and use ID's from nextValidId method instead of consuming it from user.
class PlaceOrderController < AbstractActionController
  class << self
    def registry
      InteractiveBrokersProxy.order_id_registry
    end

    def action_name
      "placeOrder"
    end
  end

  post("/#{action_name}", provides: default_content_type) do
    settings.registry.register(registry_key, new_channel).tap do |channel|
      settings.converter(action_name).invoke_java_method(*api_action_args)
      body ~channel
    end
  end

  private

  # create a channel which will clean up after itself
  # We'll never consume timeout message, unless timeout
  #
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Lint/Void
  def new_channel(timeout: settings.default_timeout)
    Concurrent::Channel.new.tap do |channel|
      Concurrent::Channel.go(channel) do |chan|
        ~Concurrent::Channel.timer(timeout)
        settings.logger.debug "Callback for #{self} was terminated by timeout: #{timeout}s"
        chan << JSON.dump({ error: { from: :app, message: "terminated callback" }.merge(to_h) })
        chan.close
        settings.registry.unregister(registry_key, chan)
      end
    end
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Lint/Void

  # This type of requests do not actually care about requestId provided in the request
  # Instead it use internal nextValidId java method to calculate the id
  #
  # Plus :req_ids method also requires an argument, but it is deprecated. So, calling it
  # manually, details:
  # https://interactivebrokers.github.io/tws-api/classIBApi_1_1EClient.html#aecea365530f40e7b56529238c9dd2f4a
  def registry_key
    return @registry_key if defined? @registry_key

    channel = InteractiveBrokersProxy.common_registry.find_or_register(:reqIds, order_ids_channel)
    raise("Client is not connected") unless InteractiveBrokersProxy::ProxyService.client.connected?

    InteractiveBrokersProxy::ProxyService.client.req_ids 1
    @registry_key = ~channel
  end

  # special channel for order ids management (this API naming is misleading sometimes)
  def order_ids_channel
    Concurrent::Channel.new(Concurrent::Channel::Buffer::Sliding.new(100))
  end

  # we replace user defined request id with nextValidId
  def api_action_args
    return @api_action_args if defined? @api_action_args

    @api_action_args = super.tap do |args|
      args[0] = registry_key
    end
  end

  # sinatra is using delegate method internally
  def action_name
    self.class.action_name
  end
end
