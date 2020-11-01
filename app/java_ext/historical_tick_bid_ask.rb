# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.HistoricalTickBidAsk"

class Java::ComIbClient::HistoricalTickBidAsk
  def to_ruby
    ruby_object = InteractiveBrokers::Common::HistoricalTickBidAsk.new
    ruby_object.time = time().to_ruby
    ruby_object.tick_attrib_bid_ask = tickAttribBidAsk().to_ruby
    ruby_object.price_bid = priceBid().to_ruby
    ruby_object.price_ask = priceAsk().to_ruby
    ruby_object.size_bid = sizeBid().to_ruby
    ruby_object.size_ask = sizeAsk().to_ruby

    ruby_object
  end
end
