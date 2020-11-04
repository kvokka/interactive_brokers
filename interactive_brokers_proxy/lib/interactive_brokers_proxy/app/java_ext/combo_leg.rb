# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.ComboLeg"

class Java::ComIbClient::ComboLeg
  def to_ruby
    ruby_object = InteractiveBrokersCommon::ComboLeg.new
    ruby_object.conid = conid().to_ruby
    ruby_object.ratio = ratio().to_ruby
    ruby_object.action = action().to_ruby
    ruby_object.exchange = exchange().to_ruby
    ruby_object.open_close = openClose().to_ruby
    ruby_object.short_sale_slot = shortSaleSlot().to_ruby
    ruby_object.designated_location = designatedLocation().to_ruby
    ruby_object.exempt_code = exemptCode().to_ruby

    ruby_object
  end
end
