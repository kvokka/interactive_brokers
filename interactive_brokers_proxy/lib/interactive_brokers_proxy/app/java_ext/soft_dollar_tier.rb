# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.SoftDollarTier"

class Java::ComIbClient::SoftDollarTier
  def to_ruby
    ruby_object = InteractiveBrokersCommon::SoftDollarTier.new
    ruby_object.name = name().to_ruby
    ruby_object.value = value().to_ruby
    ruby_object.display_name = displayName().to_ruby

    ruby_object
  end
end
