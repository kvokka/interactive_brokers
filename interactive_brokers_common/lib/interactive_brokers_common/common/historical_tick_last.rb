# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokersCommon
  HistoricalTickLast = Struct.new(:time, :tick_attrib_last, :price, :size, :exchange, :special_conditions, keyword_init: true) do
    def to_ib
      ib_object = Java::ComIbClient::HistoricalTickLast.new
      ib_object.time(Integer(time)).to_java unless time.nil?
      unless tick_attrib_last.nil?
        ib_object.tickAttribLast((tick_attrib_last.is_a?(TickAttribLast) ? tick_attrib_last : TickAttribLast.new(tick_attrib_last)).to_ib).to_java
      end
      ib_object.price(Float(price)).to_java unless price.nil?
      ib_object.size(Integer(size)).to_java unless size.nil?
      ib_object.exchange(String(exchange)).to_java unless exchange.nil?
      ib_object.specialConditions(String(special_conditions)).to_java unless special_conditions.nil?

      ib_object
    end

    def check_value_types!
      Integer(time) unless time.nil?
      unless tick_attrib_last.nil?
        tick_attrib_last.is_a?(TickAttribLast) ? tick_attrib_last : TickAttribLast.new(tick_attrib_last)
      end
      Float(price) unless price.nil?
      Integer(size) unless size.nil?
      String(exchange) unless exchange.nil?
      String(special_conditions) unless special_conditions.nil?

      true
    end
  end
end
