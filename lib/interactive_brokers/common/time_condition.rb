# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokers
  module Common
    TimeCondition = Struct.new(:time, keyword_init: true) do
      def initialize(time: nil)
        self.time = time
      end

      def to_ib
        ib_object = Java::ComIbClient::TimeCondition.new
        ib_object.time(time).to_java unless time.nil?

        ib_object
      end
    end
  end
end
