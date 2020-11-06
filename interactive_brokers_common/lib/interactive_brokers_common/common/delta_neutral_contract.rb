# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokersCommon
  DeltaNeutralContract = Struct.new(:conid, :delta, :price, keyword_init: true) do
    def to_ib
      ib_object = Java::ComIbClient::DeltaNeutralContract.new
      ib_object.conid(Integer(conid)).to_java unless conid.nil?
      ib_object.delta(Float(delta)).to_java unless delta.nil?
      ib_object.price(Float(price)).to_java unless price.nil?

      ib_object
    end
  end
end
