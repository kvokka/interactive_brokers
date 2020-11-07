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
      current_field = :price
      Float(price) unless price.nil?

      true
    rescue StandardError => e
      raise $ERROR_INFO, e.message.concat(". Check value of \"#{current_field}\""), $ERROR_INFO.backtrace
    end
  end
end
