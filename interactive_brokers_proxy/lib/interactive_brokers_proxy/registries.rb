# frozen_string_literal: true

module InteractiveBrokersProxy
  module Registries
    # All channels, which are not scoped by ID are global and are stored here
    def common_registry
      @common_registry ||= Registry.new(name: :common, key_class: Symbol, observer: supported_methods_registry)
    end

    # All channels, which are scoped by request ID
    def req_id_registry
      @req_id_registry ||= Registry.new(name: :req_id, key_class: Integer, observer: supported_methods_registry)
    end

    # All channels, which are scoped by order ID
    def order_id_registry
      @order_id_registry ||= Registry.new(name: :order_id, key_class: Integer, observer: supported_methods_registry)
    end

    # Convenient way to see the list of methods which are already supported
    def supported_methods_registry
      @supported_methods_registry ||= Registry.new(name: "Supported JAVA API methods", key_class: Symbol) { Set.new }
    end
  end

  extend Registries
end
