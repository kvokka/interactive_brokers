# frozen_string_literal: true

require_relative "application_controller"

class AbstractActionController < ApplicationController
  class << self
    # Should match with TWS API +EClient+ function name
    def api_action_name
      name.sub(/Controller$/, "").camelcase(:lower).to_sym
    end

    # Should be overwritten
    # @return Registry
    def registry
      raise NotImplementedError, "replace with Registry in abstract controller"
    end

    # Produce arguments converter for this method
    def converter
      @converter ||= InteractiveBrokersProxy::JavaMethodDynamicConverter.new(api_action_name)
    end

    # All supported methods are stored in +InteractiveBrokersProxy.supported_methods_registry+
    # for easier access
    def inject_in_supported_methods_registry
      InteractiveBrokersProxy.supported_methods_registry[registry.name] << api_action_name
    end

    def action
      inject_in_supported_methods_registry
      post("/#{api_action_name}", provides: default_content_type) do
        settings.converter.invoke_java_method(*api_action_args)
        body settings.registry.add_uniq_record!(registry_key, Concurrent::Channel.new(capacity: 1_000))
      end
    end
  end

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
end
