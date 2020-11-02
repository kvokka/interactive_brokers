# frozen_string_literal: true

require_relative "config/boot"
require "sinatra/base"
require "vendor/TwsApi.jar"

class App < Sinatra::Base
  set :environments, %w[test development production]
  set :root,         ENV["APP_PATH"]

  enable :logging, :dump_errors

  file = File.new("#{ENV['APP_PATH']}/log/#{settings.environment}.log", "a+")
  file.sync = true
  use Rack::CommonLogger, file
end

Dir["#{ENV['APP_PATH']}/core_ext/**/*.rb"].sort.each { |file| require file }
Dir["#{ENV['APP_PATH']}/java_ext/**/*.rb"].sort.each { |file| require file }
Dir["#{ENV['APP_PATH']}/controllers/**/*.rb"].sort.each { |file| require file }
Dir["#{ENV['ROOT_PATH']}/lib/interactive_brokers/common/**/*.rb"].sort.each { |file| require file }
