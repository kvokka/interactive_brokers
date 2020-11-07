# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokersCommon
  OrderType = Struct.new(:api_string, keyword_init: true) do
    def to_ib
      ib_object = Java::ComIbClient::OrderType.new
      # Java method 'apiString' does not have setter/getter

      ib_object
    end

    def check_value_types!
      # Java method 'apiString' does not have setter/getter

      true
    end
  end
end
