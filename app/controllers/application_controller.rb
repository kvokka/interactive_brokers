# frozen_string_literal: true

class ApplicationController < Sinatra::Base
  helpers ApplicationHelper

  set :environments, %w[test development production]
  set :root,         ENV["APP_PATH"]

  enable :logging, :dump_errors

  file = File.new("#{ENV['APP_PATH']}/log/#{settings.environment}.log", "a+")
  file.sync = true
  use Rack::CommonLogger, file
end
