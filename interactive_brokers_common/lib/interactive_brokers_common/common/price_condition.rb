# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokersCommon
  PriceCondition = Struct.new(:price, :trigger_method, keyword_init: true) do
    def to_ib
      ib_object = Java::ComIbClient::PriceCondition.new
      ib_object.price(Float(price)).to_java unless price.nil?
      ib_object.triggerMethod(Integer(trigger_method)).to_java unless trigger_method.nil?

      ib_object
    end
  end
end
