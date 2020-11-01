# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokers
  module Common
    DeltaNeutralContract = Struct.new(:conid, :delta, :price, keyword_init: true) do
      def initialize(conid: nil, delta: nil, price: nil)
        self.conid = conid
        self.delta = delta
        self.price = price
      end

      def to_ib
        ib_object = Java::ComIbClient::DeltaNeutralContract.new
        ib_object.conid(conid).to_java unless conid.nil?
        ib_object.delta(delta).to_java unless delta.nil?
        ib_object.price(price).to_java unless price.nil?

        ib_object
      end
    end
  end
end
