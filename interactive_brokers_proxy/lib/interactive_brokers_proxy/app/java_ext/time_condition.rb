# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.TimeCondition"

class Java::ComIbClient::TimeCondition
  # Java api is inconsistent so we sadly must to check if we have the setter for each method
  def to_ruby
    ruby_object = InteractiveBrokersCommon::TimeCondition.new
    ruby_object.time = time().to_ruby if respond_to?(:time)

    ruby_object
  end
end
