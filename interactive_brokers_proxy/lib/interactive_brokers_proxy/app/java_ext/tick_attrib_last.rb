# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.TickAttribLast"

class Java::ComIbClient::TickAttribLast
  # Java api is inconsistent so we sadly must to check if we have the setter for each method
  def to_ruby
    ruby_object = InteractiveBrokersCommon::TickAttribLast.new
    ruby_object.past_limit = pastLimit().to_ruby if respond_to?(:pastLimit)
    ruby_object.unreported = unreported().to_ruby if respond_to?(:unreported)

    ruby_object
  end
end
