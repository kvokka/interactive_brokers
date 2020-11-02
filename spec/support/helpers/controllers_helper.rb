# frozen_string_literal: true

module RSpec
  module Helpers
    module Controllers
      module App
        def app
          ::App
        end
      end
    end
  end

  configure do |config|
    config.include Helpers::Controllers::App, type: :controller
  end
end
