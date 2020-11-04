# frozen_string_literal: true

require "sinatra/base"
require "sinatra/router"

Dir["#{__dir__}/java_ext/**/*.rb"].sort.each { |f| require f }
Dir["#{__dir__}/helpers/**/*.rb"].sort.each { |f| require f }
Dir["#{__dir__}/controllers/**/*.rb"].sort.each { |f| require f }

APP = (Sinatra::Router.new do
  mount StatusController
end)
