# frozen_string_literal: true

RSpec.describe InteractiveBrokers do
  it "has a version number" do
    expect(InteractiveBrokers::VERSION).not_to be nil
  end

  it "has a logger" do
    expect(described_class.logger).to be_a Logger
  end
end
