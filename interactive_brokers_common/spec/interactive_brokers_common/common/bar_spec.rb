# frozen_string_literal: true

module InteractiveBrokersCommon
  RSpec.describe Bar do
    describe "#check_value_types!" do
      context "with no values" do
        no_error
      end

      context "with good values" do
        subject { described_class.new time: "str", open: 1, high: 2, low: 3, close: 4, volume: 5, count: 6, wap: 7 }

        no_error
      end

      context "with wrong type on open" do
        subject do
          described_class.new time: "str", open: "wrong", high: 2, low: 3, close: 4, volume: 5, count: 6, wap: 7
        end

        with_error(message: 'invalid value for Float(): "wrong". Check value of "open"')
      end

      context "with wrong type (float) on count" do
        subject { described_class.new time: "str", open: 1, high: 2, low: 3, close: 4, volume: 5, count: "6.0", wap: 7 }

        with_error(message: 'invalid value for Integer(): "6.0". Check value of "count"')
      end

      context "with wrong type (str) on count" do
        subject { described_class.new time: "str", open: 1, high: 2, low: 3, close: 4, volume: 5, count: "foo", wap: 7 }

        with_error(message: 'invalid value for Integer(): "foo". Check value of "count"')
      end
    end
  end
end
