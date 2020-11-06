# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.OrderType"

class Java::ComIbClient::OrderType
  def to_ruby
    ruby_object = InteractiveBrokersCommon::OrderType.new
    ruby_object.api_string = apiString().to_ruby

    ruby_object
  end
end
