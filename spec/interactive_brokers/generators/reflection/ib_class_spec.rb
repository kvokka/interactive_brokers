# frozen_string_literal: true

java_import "com.ib.client.Contract"
require "interactive_brokers/generators/reflection/ib_class"

RSpec.describe InteractiveBrokers::Generators::Reflection::IbClass do
  subject(:ib_class) { described_class.new(Java::ComIbClient::Contract) }

  describe "#name" do
    it "returns the simple class name" do
      expect(ib_class.name).to eq("Contract")
    end
  end

  describe "#full_name" do
    it "returns the full qualified class name" do
      expect(ib_class.full_name).to eq("Java::ComIbClient::Contract")
    end
  end
end
