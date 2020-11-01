# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokers
  module Common
    TickAttribLast = Struct.new(:past_limit, :unreported, keyword_init: true) do
      def initialize(past_limit: nil, unreported: nil)
        self.past_limit = past_limit
        self.unreported = unreported
      end

      def to_ib
        ib_object = Java::ComIbClient::TickAttribLast.new
        ib_object.pastLimit(past_limit).to_java unless past_limit.nil?
        ib_object.unreported(unreported).to_java unless unreported.nil?

        ib_object
      end
    end
  end
end
