# frozen_string_literal: true

class App < Sinatra::Base
  get("/status") do
    [200, "OK"]
  end
end
