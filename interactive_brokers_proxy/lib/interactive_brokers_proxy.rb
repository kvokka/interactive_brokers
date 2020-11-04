# frozen_string_literal: true

require "interactive_brokers_common"
require "interactive_brokers_common/core_ext"
require_relative "../../vendor/TwsApi.jar"

require "interactive_brokers_proxy/version"
require "interactive_brokers_proxy/registry"

require "interactive_brokers_proxy/app/app"

module InteractiveBrokersProxy
  DEFAULT_GATEWAY_HOST = "localhost"
  DEFAULT_GATEWAY_PORT = 4002

  def self.connect_with_gateway
    puts "connect_with_gateway stub"
  end
end
