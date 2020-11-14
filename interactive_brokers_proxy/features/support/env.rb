# frozen_string_literal: true

ENV["RACK_ENV"] = "test"
ENV["TEMP_PATH"] ||= "tmp"
ENV["TEST_APP_PORT"] ||= "3334"
ENV["DEFAULT_TIMEOUT"] = "1"
ENV["LOG_LEVEL"] ||= "fatal" # I want to see clean tests report by default

require "interactive_brokers_proxy"
require "typhoeus"
require "pry"
require "amazing_print"

Dir.mkdir(ENV["TEMP_PATH"]) unless Dir.exist?(ENV["TEMP_PATH"])

module MyWorld
  # next_valid_id from TWS sucks, use own replacement
  def next_valid_id
    File.open("#{ENV['TEMP_PATH']}/next_valid_id", "a+") do |f|
      next_value = f.gets.to_i + 1
      f.truncate(0)
      f.puts(next_value)
      next_value
    end
  end

  def get(path:, **_)
    path = "/#{path}" unless path[0] == "/"
    Typhoeus.get("0.0.0.0:#{ENV['TEST_APP_PORT']}#{path}")
  end

  def post(path:, body:, **_)
    path = "/#{path}" unless path[0] == "/"
    Typhoeus.post("0.0.0.0:#{ENV['TEST_APP_PORT']}#{path}", body: body.to_json)
  end
end

World MyWorld

AfterConfiguration do
  extend MyWorld

  last_attempt = 50.times.map do
    r = get(path: "/status")
    break :ok if r.return_code == :ok

    sleep(0.1)
  end
  raise("Could not start app server") unless last_attempt == :ok
end

$app_thread = Thread.new do
  require "rack/handler/puma"
  app = Rack::Builder.new { |builder| builder.run ::APP }
  Rack::Handler::Puma.run app, Port: ENV["TEST_APP_PORT"].to_i
end

at_exit do
  $app_thread.exit
end
