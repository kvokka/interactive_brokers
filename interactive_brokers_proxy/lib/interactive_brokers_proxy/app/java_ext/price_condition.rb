# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.PriceCondition"

class Java::ComIbClient::PriceCondition
  # Java api is inconsistent so we sadly must to check if we have the setter for each method
  def to_ruby
    ruby_object = InteractiveBrokersCommon::PriceCondition.new
    ruby_object.price = price().to_ruby if respond_to?(:price)
    ruby_object.trigger_method = triggerMethod().to_ruby if respond_to?(:triggerMethod)

    ruby_object
  end
end
