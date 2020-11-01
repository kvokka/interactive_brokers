# frozen_string_literal: true

java_import "com.ib.client.Contract"
java_import "com.ib.client.ComboLeg"
require "interactive_brokers/generators/reflection/ib_class"
require "jruby/core_ext"

RSpec.describe InteractiveBrokers::Generators::Reflection::IbField do
  subject(:ib_class) { InteractiveBrokers::Generators::Reflection::IbClass.new(Java::ComIbClient::Contract) }

  describe "#name" do
    it "returns the accessor name even when the property field uses a different case" do
      # the underlying field is m_lastTradedateOrContractMonth
      expect(field("lastTradeDateOrContractMonth").name).to eq("lastTradeDateOrContractMonth")
    end
  end

  def field(name)
    InteractiveBrokers::Generators::Reflection::IbField.new(find_field(name), ib_class)
  end

  def find_field(name)
    ib_class.java_property_fields.find { |field| field.name == name }.java_field
  end
end
