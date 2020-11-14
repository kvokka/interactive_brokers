# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.HistoricalTick"

class Java::ComIbClient::HistoricalTick
  # Java api is inconsistent so we sadly must to check if we have the setter for each method
  def to_ruby
    ruby_object = InteractiveBrokersCommon::HistoricalTick.new
    ruby_object.time = time().to_ruby if respond_to?(:time)
    ruby_object.price = price().to_ruby if respond_to?(:price)
    ruby_object.size = size().to_ruby if respond_to?(:size)

    ruby_object
  end
end
