# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.TimeCondition"

class Java::ComIbClient::TimeCondition
  def to_ruby
    ruby_object = InteractiveBrokersCommon::TimeCondition.new
    ruby_object.time = time().to_ruby

    ruby_object
  end
end
