# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokers
  module Common
    ComboLeg = Struct.new(:conid, :ratio, :action, :exchange, :open_close, :short_sale_slot, :designated_location, :exempt_code, keyword_init: true) do
      def to_ib
        ib_object = Java::ComIbClient::ComboLeg.new
        ib_object.conid(conid).to_java unless conid.nil?
        ib_object.ratio(ratio).to_java unless ratio.nil?
        ib_object.action(action).to_java unless action.nil?
        ib_object.exchange(exchange).to_java unless exchange.nil?
        ib_object.openClose(open_close).to_java unless open_close.nil?
        ib_object.shortSaleSlot(short_sale_slot).to_java unless short_sale_slot.nil?
        ib_object.designatedLocation(designated_location).to_java unless designated_location.nil?
        ib_object.exemptCode(exempt_code).to_java unless exempt_code.nil?

        ib_object
      end
    end
  end
end
