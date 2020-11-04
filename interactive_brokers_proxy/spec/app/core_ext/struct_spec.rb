# frozen_string_literal: true

# Check that core extensions are correctly loaded from interactive_brokers_common gem
RSpec.describe Struct do
  subject(:struct) { described_class.new :foo, :bar, keyword_init: true }

  it("has attributes") { expect(struct.attributes).to include :foo, :bar }
end
