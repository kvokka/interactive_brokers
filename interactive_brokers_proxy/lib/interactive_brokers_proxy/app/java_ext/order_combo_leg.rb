# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.OrderComboLeg"

class Java::ComIbClient::OrderComboLeg
  def to_ruby
    ruby_object = InteractiveBrokersCommon::OrderComboLeg.new
    ruby_object.price = price().to_ruby

    ruby_object
  end
end
