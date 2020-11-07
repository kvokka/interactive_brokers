# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokersCommon
  TagValue = Struct.new(:tag, :value, keyword_init: true) do
    def to_ib
      ib_object = Java::ComIbClient::TagValue.new
      # Java method 'tag' does not have setter/getter
      # Java method 'value' does not have setter/getter

      ib_object
    end

    def check_value_types!
      # Java method 'tag' does not have setter/getter
      # Java method 'value' does not have setter/getter

      true
    rescue StandardError => e
      raise $ERROR_INFO, e.message.concat(". Check value of \"#{current_field}\""), $ERROR_INFO.backtrace
    end
  end
end
