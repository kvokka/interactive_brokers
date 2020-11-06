# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.TagValue"

class Java::ComIbClient::TagValue
  def to_ruby
    ruby_object = InteractiveBrokersCommon::TagValue.new
    ruby_object.tag = tag().to_ruby
    ruby_object.value = value().to_ruby

    ruby_object
  end
end
