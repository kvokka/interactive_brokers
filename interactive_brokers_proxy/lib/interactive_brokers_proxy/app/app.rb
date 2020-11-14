# frozen_string_literal: true

require "sinatra/base"
require "sinatra/json"
# require "sinatra/multi_route"  # <= looks like it'll be good idea to add to IdActionController
require "sinatra/router"

require "json"

Dir["#{__dir__}/java_ext/**/*.rb"].sort.each { |f| require f }
Dir["#{__dir__}/helpers/**/*.rb"].sort.each { |f| require f }
Dir["#{__dir__}/controllers/**/*.rb"].sort.each { |f| require f }

APP = (Sinatra::Router.new do
  mount StatusController
  mount ReqIdActionsController
  mount PlaceOrderController
end)
