# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.HistoricalTickLast"

class Java::ComIbClient::HistoricalTickLast
  # Java api is inconsistent so we sadly must to check if we have the setter for each method
  def to_ruby
    ruby_object = InteractiveBrokersCommon::HistoricalTickLast.new
    ruby_object.time = time().to_ruby if respond_to?(:time)
    ruby_object.tick_attrib_last = tickAttribLast().to_ruby if respond_to?(:tickAttribLast)
    ruby_object.price = price().to_ruby if respond_to?(:price)
    ruby_object.size = size().to_ruby if respond_to?(:size)
    ruby_object.exchange = exchange().to_ruby if respond_to?(:exchange)
    ruby_object.special_conditions = specialConditions().to_ruby if respond_to?(:specialConditions)

    ruby_object
  end
end
