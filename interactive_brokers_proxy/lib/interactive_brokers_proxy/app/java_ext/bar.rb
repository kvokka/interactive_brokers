# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.Bar"

class Java::ComIbClient::Bar
  # Java api is inconsistent so we sadly must to check if we have the setter for each method
  def to_ruby
    ruby_object = InteractiveBrokersCommon::Bar.new
    ruby_object.time = time().to_ruby if respond_to?(:time)
    ruby_object.open = open().to_ruby if respond_to?(:open)
    ruby_object.high = high().to_ruby if respond_to?(:high)
    ruby_object.low = low().to_ruby if respond_to?(:low)
    ruby_object.close = close().to_ruby if respond_to?(:close)
    ruby_object.volume = volume().to_ruby if respond_to?(:volume)
    ruby_object.count = count().to_ruby if respond_to?(:count)
    ruby_object.wap = wap().to_ruby if respond_to?(:wap)

    ruby_object
  end
end
