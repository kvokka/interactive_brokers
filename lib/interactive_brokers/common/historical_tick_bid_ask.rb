# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokers
  module Common
    HistoricalTickBidAsk = Struct.new(:time, :tick_attrib_bid_ask, :price_bid, :price_ask, :size_bid, :size_ask, keyword_init: true) do
      def initialize(time: nil, tick_attrib_bid_ask: nil, price_bid: nil, price_ask: nil, size_bid: nil, size_ask: nil)
        self.time = time
        self.tick_attrib_bid_ask = tick_attrib_bid_ask
        self.price_bid = price_bid
        self.price_ask = price_ask
        self.size_bid = size_bid
        self.size_ask = size_ask
      end

      def to_ib
        ib_object = Java::ComIbClient::HistoricalTickBidAsk.new
        ib_object.time(time).to_java unless time.nil?
        ib_object.tickAttribBidAsk(tick_attrib_bid_ask).to_java unless tick_attrib_bid_ask.nil?
        ib_object.priceBid(price_bid).to_java unless price_bid.nil?
        ib_object.priceAsk(price_ask).to_java unless price_ask.nil?
        ib_object.sizeBid(size_bid).to_java unless size_bid.nil?
        ib_object.sizeAsk(size_ask).to_java unless size_ask.nil?

        ib_object
      end
    end
  end
end
