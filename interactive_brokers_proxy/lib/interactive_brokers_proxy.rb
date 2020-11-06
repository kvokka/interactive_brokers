# frozen_string_literal: true

require "active_support/core_ext/module/delegation"
require "active_support/core_ext/string/inflections"

require "interactive_brokers_common"
require "interactive_brokers_common/core_ext"
require_relative "../../vendor/TwsApi.jar"

require "interactive_brokers_proxy/version"
require "interactive_brokers_proxy/registry"
require "interactive_brokers_proxy/proxy_service"

require "interactive_brokers_proxy/app/app"

module InteractiveBrokersProxy
  class << self
    def common_registry
      @common_registry ||= Registry.new(name: "common", key_class: Symbol)
    end

    def req_id_registry
      @req_id_registry ||= Registry.new(name: "requests by ID", key_class: Integer)
    end
  end

  def self.connect_with_gateway
    puts "connect_with_gateway stub"
  end
end
