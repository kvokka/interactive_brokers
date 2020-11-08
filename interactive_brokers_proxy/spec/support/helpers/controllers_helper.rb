# frozen_string_literal: true

module RSpec
  module Helpers
    module Controllers
      module App
        def app
          ::APP
        end

        # next_valid_id from TWS sucks, use own replacement
        def next_valid_id
          File.open("tmp/next_valid_id", "a+") do |f|
            next_value = f.gets.to_i + 1
            f.truncate(0)
            f.puts(next_value)
            next_value
          end
        end
      end
    end
  end

  configure do |config|
    config.include Helpers::Controllers::App, type: :controller
  end
end
