# frozen_string_literal: true

require_relative "config/boot"
require "sinatra/base"
require "sinatra/router"
require "vendor/TwsApi.jar"

Dir["#{ENV['APP_PATH']}/{core_ext,java_ext,helpers}/**/*.rb"].sort.each { |file| require file }
Dir["#{ENV['APP_PATH']}/controllers/**/*.rb"].sort.each { |file| require file }
Dir["#{ENV['ROOT_PATH']}/lib/interactive_brokers/common/**/*.rb"].sort.each { |file| require file }

APP = (Sinatra::Router.new do
  mount StatusController
end)
