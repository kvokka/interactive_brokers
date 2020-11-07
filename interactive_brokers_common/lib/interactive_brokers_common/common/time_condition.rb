# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokersCommon
  TimeCondition = Struct.new(:time, keyword_init: true) do
    def to_ib
      ib_object = Java::ComIbClient::TimeCondition.new
      ib_object.time(String(time)).to_java unless time.nil?

      ib_object
    end

    def check_value_types!
      String(time) unless time.nil?

      true
    end
  end
end
