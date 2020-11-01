# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokers
  module Common
    TickAttribBidAsk = Struct.new(:bid_past_low, :ask_past_high, keyword_init: true) do
      def initialize(bid_past_low: nil, ask_past_high: nil)
        self.bid_past_low = bid_past_low
        self.ask_past_high = ask_past_high
      end

      def to_ib
        ib_object = Java::ComIbClient::TickAttribBidAsk.new
        ib_object.bidPastLow(bid_past_low).to_java unless bid_past_low.nil?
        ib_object.askPastHigh(ask_past_high).to_java unless ask_past_high.nil?

        ib_object
      end
    end
  end
end
