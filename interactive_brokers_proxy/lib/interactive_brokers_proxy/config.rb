# frozen_string_literal: true

require "logger"

module InteractiveBrokersProxy
  class Config
    class << self
      attr_accessor :logger
    end

    self.logger ||= Logger.new($stdout)
  end
end
