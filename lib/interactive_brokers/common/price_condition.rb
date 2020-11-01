# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokers
  module Common
    PriceCondition = Struct.new(:price, :trigger_method, keyword_init: true) do
      def initialize(price: nil, trigger_method: nil)
        self.price = price
        self.trigger_method = trigger_method
      end

      def to_ib
        ib_object = Java::ComIbClient::PriceCondition.new
        ib_object.price(price).to_java unless price.nil?
        ib_object.triggerMethod(trigger_method).to_java unless trigger_method.nil?

        ib_object
      end
    end
  end
end
