# frozen_string_literal: true

class ApplicationController < Sinatra::Base
  set :environments, %w[test development production]
  set :root,         Pathname.new(__dir__).parent.parent.parent.parent.to_s
  set(:gateway_client) { InteractiveBrokersProxy::ProxyService.client }
  set :default_content_type, "application/x-ndjson"
  set(:default_timeout) { Integer ENV.fetch("DEFAULT_TIMEOUT", "5") }
  set :default_channel_capacity, 1000
  # set :show_exceptions, :after_handler

  disable :dump_errors # we manage it in errors block, see https://github.com/sinatra/sinatra/issues/1664
  enable :logging

  set(:logger) { InteractiveBrokersProxy::Config.logger }
  configure do
    use ::Rack::CommonLogger, settings.logger
  end

  error do
    logger.error({ error: {
      from: :gem,
      route: env["sinatra.route"],
      params: env["sinatra.error.params"],
      env: env["sinatra.error"],
      message: env["sinatra.error"].message
    } }.to_s)
  end
end
