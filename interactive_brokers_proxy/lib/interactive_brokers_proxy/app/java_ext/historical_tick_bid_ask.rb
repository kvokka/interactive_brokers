# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.HistoricalTickBidAsk"

class Java::ComIbClient::HistoricalTickBidAsk
  # Java api is inconsistent so we sadly must to check if we have the setter for each method
  def to_ruby
    ruby_object = InteractiveBrokersCommon::HistoricalTickBidAsk.new
    ruby_object.time = time().to_ruby if respond_to?(:time)
    ruby_object.tick_attrib_bid_ask = tickAttribBidAsk().to_ruby if respond_to?(:tickAttribBidAsk)
    ruby_object.price_bid = priceBid().to_ruby if respond_to?(:priceBid)
    ruby_object.price_ask = priceAsk().to_ruby if respond_to?(:priceAsk)
    ruby_object.size_bid = sizeBid().to_ruby if respond_to?(:sizeBid)
    ruby_object.size_ask = sizeAsk().to_ruby if respond_to?(:sizeAsk)

    ruby_object
  end
end
