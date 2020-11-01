# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokers
  module Common
    HistoricalTickLast = Struct.new(:time, :tick_attrib_last, :price, :size, :exchange, :special_conditions, keyword_init: true) do
      def to_ib
        ib_object = Java::ComIbClient::HistoricalTickLast.new
        ib_object.time(time).to_java unless time.nil?
        ib_object.tickAttribLast(tick_attrib_last).to_java unless tick_attrib_last.nil?
        ib_object.price(price).to_java unless price.nil?
        ib_object.size(size).to_java unless size.nil?
        ib_object.exchange(exchange).to_java unless exchange.nil?
        ib_object.specialConditions(special_conditions).to_java unless special_conditions.nil?

        ib_object
      end
    end
  end
end
