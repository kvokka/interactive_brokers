# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.OrderComboLeg"

class Java::ComIbClient::OrderComboLeg
  # Java api is inconsistent so we sadly must to check if we have the setter for each method
  def to_ruby
    ruby_object = InteractiveBrokersCommon::OrderComboLeg.new
    ruby_object.price = price().to_ruby if respond_to?(:price)

    ruby_object
  end
end
