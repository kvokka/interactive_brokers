# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.HistoricalTick"

class Java::ComIbClient::HistoricalTick
  def to_ruby
    ruby_object = InteractiveBrokers::Common::HistoricalTick.new
    ruby_object.time = time().to_ruby
    ruby_object.price = price().to_ruby
    ruby_object.size = size().to_ruby

    ruby_object
  end
end
