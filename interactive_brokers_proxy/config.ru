# frozen_string_literal: true

require_relative "lib/interactive_brokers_proxy"

InteractiveBrokersProxy.connect_with_gateway
run APP
