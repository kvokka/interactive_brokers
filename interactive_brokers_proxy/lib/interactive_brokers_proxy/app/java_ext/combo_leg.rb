# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.ComboLeg"

class Java::ComIbClient::ComboLeg
  # Java api is inconsistent so we sadly must to check if we have the setter for each method
  def to_ruby
    ruby_object = InteractiveBrokersCommon::ComboLeg.new
    ruby_object.conid = conid().to_ruby if respond_to?(:conid)
    ruby_object.ratio = ratio().to_ruby if respond_to?(:ratio)
    ruby_object.action = action().to_ruby if respond_to?(:action)
    ruby_object.exchange = exchange().to_ruby if respond_to?(:exchange)
    ruby_object.open_close = openClose().to_ruby if respond_to?(:openClose)
    ruby_object.short_sale_slot = shortSaleSlot().to_ruby if respond_to?(:shortSaleSlot)
    ruby_object.designated_location = designatedLocation().to_ruby if respond_to?(:designatedLocation)
    ruby_object.exempt_code = exemptCode().to_ruby if respond_to?(:exemptCode)

    ruby_object
  end
end
