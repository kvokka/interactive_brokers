# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.SoftDollarTier"

class Java::ComIbClient::SoftDollarTier
  # Java api is inconsistent so we sadly must to check if we have the setter for each method
  def to_ruby
    ruby_object = InteractiveBrokersCommon::SoftDollarTier.new
    ruby_object.name = name().to_ruby if respond_to?(:name)
    ruby_object.value = value().to_ruby if respond_to?(:value)
    ruby_object.display_name = displayName().to_ruby if respond_to?(:displayName)

    ruby_object
  end
end
