# frozen_string_literal: true

class StatusController < ApplicationController
  get("/status") do
    [200, "OK"]
  end
end
