# frozen_string_literal: true

require "pathname"

class ApplicationController < Sinatra::Base
  helpers ApplicationHelper

  set :environments, %w[test development production]
  set :root,         Pathname.new(__dir__).parent.parent.parent.parent.to_s
  set :common_registry, InteractiveBrokersProxy::Registry.new(name: "common", key_class: Symbol)
  set :req_id_registry, InteractiveBrokersProxy::Registry.new(name: "requests by ID", key_class: Integer)

  enable :logging, :dump_errors

  file = File.new("#{settings.root}/log/#{settings.environment}.log", "a+")
  file.sync = true
  use Rack::CommonLogger, file
end
