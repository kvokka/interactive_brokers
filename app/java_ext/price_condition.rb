# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.PriceCondition"

class Java::ComIbClient::PriceCondition
  def to_ruby
    ruby_object = InteractiveBrokers::Common::PriceCondition.new
    ruby_object.price = price().to_ruby
    ruby_object.trigger_method = triggerMethod().to_ruby

    ruby_object
  end
end
