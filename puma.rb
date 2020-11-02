# frozen_string_literal: true

threads 0, Integer(ENV["MAX_THREAD_COUNT"] || 5)

rackup      DefaultRackup
port        ENV["PORT"]     || 3333
environment ENV["RACK_ENV"] || "development"
