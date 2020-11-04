# frozen_string_literal: true

RSpec.describe InteractiveBrokersGenerator::ApiClassFilesGenerator do
  describe "::config" do
    it "returns a hash" do
      expect(described_class.config).to be_a Hash
    end

    it "contains classes key with some array" do
      expect(described_class.config["classes"]).to be_a Array
    end
  end
end
