# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokersCommon
  OrderComboLeg = Struct.new(:price, keyword_init: true) do
    def to_ib
      ib_object = Java::ComIbClient::OrderComboLeg.new
      ib_object.price(Float(price)).to_java unless price.nil?

      ib_object
    end

    def check_value_types!
      Float(price) unless price.nil?

      true
    end
  end
end
