# frozen_string_literal: true

RSpec.describe Struct do
  subject(:struct) { described_class.new :foo, :bar, keyword_init: true }

  it("has attributes") { expect(struct.attributes).to include :foo, :bar }
end
