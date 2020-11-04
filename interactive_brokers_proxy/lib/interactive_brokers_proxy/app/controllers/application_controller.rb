# frozen_string_literal: true

require "pathname"

class ApplicationController < Sinatra::Base
  helpers ApplicationHelper

  set :environments, %w[test development production]
  set :root,         Pathname.new(__dir__).parent.parent.parent.parent.to_s

  enable :logging, :dump_errors

  file = File.new("#{settings.root}/log/#{settings.environment}.log", "a+")
  file.sync = true
  use Rack::CommonLogger, file
end
