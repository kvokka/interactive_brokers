# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.DeltaNeutralContract"

class Java::ComIbClient::DeltaNeutralContract
  # Java api is inconsistent so we sadly must to check if we have the setter for each method
  def to_ruby
    ruby_object = InteractiveBrokersCommon::DeltaNeutralContract.new
    ruby_object.conid = conid().to_ruby if respond_to?(:conid)
    ruby_object.delta = delta().to_ruby if respond_to?(:delta)
    ruby_object.price = price().to_ruby if respond_to?(:price)

    ruby_object
  end
end
