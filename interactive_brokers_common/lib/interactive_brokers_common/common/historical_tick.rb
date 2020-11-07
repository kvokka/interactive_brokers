# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokersCommon
  HistoricalTick = Struct.new(:time, :price, :size, keyword_init: true) do
    def to_ib
      ib_object = Java::ComIbClient::HistoricalTick.new
      ib_object.time(Integer(time)).to_java unless time.nil?
      ib_object.price(Float(price)).to_java unless price.nil?
      ib_object.size(Integer(size)).to_java unless size.nil?

      ib_object
    end

    def check_value_types!
      Integer(time) unless time.nil?
      Float(price) unless price.nil?
      Integer(size) unless size.nil?

      true
    end
  end
end
