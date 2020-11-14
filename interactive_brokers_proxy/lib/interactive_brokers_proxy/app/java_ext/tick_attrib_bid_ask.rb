# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.TickAttribBidAsk"

class Java::ComIbClient::TickAttribBidAsk
  # Java api is inconsistent so we sadly must to check if we have the setter for each method
  def to_ruby
    ruby_object = InteractiveBrokersCommon::TickAttribBidAsk.new
    ruby_object.bid_past_low = bidPastLow().to_ruby if respond_to?(:bidPastLow)
    ruby_object.ask_past_high = askPastHigh().to_ruby if respond_to?(:askPastHigh)

    ruby_object
  end
end
