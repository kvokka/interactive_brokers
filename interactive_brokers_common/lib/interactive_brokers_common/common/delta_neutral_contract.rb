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

    def check_value_types!
      current_field = :conid
      Integer(conid) unless conid.nil?
      current_field = :delta
      Float(delta) unless delta.nil?
      current_field = :price
      Float(price) unless price.nil?

      true
    rescue StandardError => e
      raise $ERROR_INFO, e.message.concat(". Check value of \"#{current_field}\""), $ERROR_INFO.backtrace
    end
  end
end
