# frozen_string_literal: true

require "bundler/setup"
Bundler.require(:default, ENV.fetch("RACK_ENV", "development"))

require "active_support/core_ext"
require "concurrent-edge"
require "pathname"

require "interactive_brokers_common"
require "interactive_brokers_common/core_ext"
require_relative "../../vendor/TwsApi.jar"

require "interactive_brokers_proxy/version"
require "interactive_brokers_proxy/config"
require "interactive_brokers_proxy/registry"
require "interactive_brokers_proxy/registries"
require "interactive_brokers_proxy/proxy_service"
require "interactive_brokers_proxy/java_method_dynamic_converter"

require "interactive_brokers_proxy/app/app"

module InteractiveBrokersProxy
end
