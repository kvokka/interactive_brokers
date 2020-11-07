# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokersCommon
  TickAttribBidAsk = Struct.new(:bid_past_low, :ask_past_high, keyword_init: true) do
    def to_ib
      ib_object = Java::ComIbClient::TickAttribBidAsk.new
      ib_object.bidPastLow(!!bid_past_low).to_java unless bid_past_low.nil?
      ib_object.askPastHigh(!!ask_past_high).to_java unless ask_past_high.nil?

      ib_object
    end

    def check_value_types!
      current_field = :bid_past_low
      !!bid_past_low unless bid_past_low.nil?
      current_field = :ask_past_high
      !!ask_past_high unless ask_past_high.nil?

      true
    rescue StandardError => e
      raise $ERROR_INFO, e.message.concat(". Check value of \"#{current_field}\""), $ERROR_INFO.backtrace
    end
  end
end
