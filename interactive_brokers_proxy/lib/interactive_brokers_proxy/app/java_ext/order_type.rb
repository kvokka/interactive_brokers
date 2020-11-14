# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.OrderType"

class Java::ComIbClient::OrderType
  # Java api is inconsistent so we sadly must to check if we have the setter for each method
  def to_ruby
    ruby_object = InteractiveBrokersCommon::OrderType.new
    ruby_object.api_string = apiString().to_ruby if respond_to?(:apiString)

    ruby_object
  end
end
