# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.TickAttribBidAsk"

class Java::ComIbClient::TickAttribBidAsk
  def to_ruby
    ruby_object = InteractiveBrokers::Common::TickAttribBidAsk.new
    ruby_object.bid_past_low = bidPastLow().to_ruby
    ruby_object.ask_past_high = askPastHigh().to_ruby

    ruby_object
  end
end
