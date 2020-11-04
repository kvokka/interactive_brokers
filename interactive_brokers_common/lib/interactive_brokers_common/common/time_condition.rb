# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokersCommon
  TimeCondition = Struct.new(:time, keyword_init: true) do
    def to_ib
      ib_object = Java::ComIbClient::TimeCondition.new
      ib_object.time(time).to_java unless time.nil?

      ib_object
    end
  end
end
