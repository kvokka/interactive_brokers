# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokersCommon
  SoftDollarTier = Struct.new(:name, :value, :display_name, keyword_init: true) do
    def to_ib
      ib_object = Java::ComIbClient::SoftDollarTier.new
      ib_object.name(String(name)).to_java unless name.nil?
      ib_object.value(String(value)).to_java unless value.nil?
      # Java method 'displayName' does not have setter/getter

      ib_object
    end

    def check_value_types!
      String(name) unless name.nil?
      String(value) unless value.nil?
      # Java method 'displayName' does not have setter/getter

      true
    end
  end
end
