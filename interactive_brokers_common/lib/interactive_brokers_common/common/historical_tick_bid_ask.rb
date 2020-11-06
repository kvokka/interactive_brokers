# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokersCommon
  HistoricalTickBidAsk = Struct.new(:time, :tick_attrib_bid_ask, :price_bid, :price_ask, :size_bid, :size_ask, keyword_init: true) do
    def to_ib
      ib_object = Java::ComIbClient::HistoricalTickBidAsk.new
      ib_object.time(Integer(time)).to_java unless time.nil?
      unless tick_attrib_bid_ask.nil?
        ib_object.tickAttribBidAsk((tick_attrib_bid_ask.is_a?(TickAttribBidAsk) ? tick_attrib_bid_ask : TickAttribBidAsk.new(tick_attrib_bid_ask)).to_ib).to_java
      end
      ib_object.priceBid(Float(price_bid)).to_java unless price_bid.nil?
      ib_object.priceAsk(Float(price_ask)).to_java unless price_ask.nil?
      ib_object.sizeBid(Integer(size_bid)).to_java unless size_bid.nil?
      ib_object.sizeAsk(Integer(size_ask)).to_java unless size_ask.nil?

      ib_object
    end
  end
end
