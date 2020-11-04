# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.HistoricalTickLast"

class Java::ComIbClient::HistoricalTickLast
  def to_ruby
    ruby_object = InteractiveBrokersCommon::HistoricalTickLast.new
    ruby_object.time = time().to_ruby
    ruby_object.tick_attrib_last = tickAttribLast().to_ruby
    ruby_object.price = price().to_ruby
    ruby_object.size = size().to_ruby
    ruby_object.exchange = exchange().to_ruby
    ruby_object.special_conditions = specialConditions().to_ruby

    ruby_object
  end
end
