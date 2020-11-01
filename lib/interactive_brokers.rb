# frozen_string_literal: true

require "interactive_brokers/version"
require "logger"

require "active_support/core_ext/string/inflections"

Dir["./lib/interactive_brokers/common/**/*.rb"].each { |file| require file }

module InteractiveBrokers
  class Error < StandardError; end

  LOGGER_LEVEL = Logger::DEBUG

  # Gem logger
  #
  # @return [Logger]
  def self.logger
    @logger ||= Logger.new(STDOUT).tap do |logger|
      logger.level = LOGGER_LEVEL
    end
  end
end
