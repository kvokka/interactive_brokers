# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.TagValue"

class Java::ComIbClient::TagValue
  # Java api is inconsistent so we sadly must to check if we have the setter for each method
  def to_ruby
    ruby_object = InteractiveBrokersCommon::TagValue.new
    ruby_object.tag = tag().to_ruby if respond_to?(:tag)
    ruby_object.value = value().to_ruby if respond_to?(:value)

    ruby_object
  end
end
