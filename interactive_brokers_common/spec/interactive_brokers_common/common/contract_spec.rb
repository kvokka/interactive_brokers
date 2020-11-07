# frozen_string_literal: true

module InteractiveBrokersCommon
  RSpec.describe Contract do
    describe "#check_value_types!" do
      context "with no values" do
        no_error
      end

      context "with good values" do
        subject { described_class.new symbol: "str", sec_id: "another" }

        no_error
      end

      context "with empty delta_neutral_contract" do
        subject { described_class.new delta_neutral_contract: {} }

        no_error
      end

      context "with delta_neutral_contract" do
        context "with right values types" do
          subject { described_class.new delta_neutral_contract: { conid: 1, delta: "42" } }

          no_error
        end

        context "with wrong delta" do
          subject { described_class.new delta_neutral_contract: { conid: 1, delta: "wrong" } }

          with_error(message:
         'invalid value for Float(): "wrong". Check value of "delta". Check value of "delta_neutral_contract"')
        end

        # rubocop:disable Layout/LineLength
        context "with wrong value type on price" do
          subject { described_class.new delta_neutral_contract: { conid: 1, price: [] } }

          with_error(klass: TypeError, message: 'no implicit conversion of Array into Float. Check value of "price". Check value of "delta_neutral_contract"')
        end
        # rubocop:enable Layout/LineLength
      end

      context "with combo_legs" do
        context "with empty array" do
          subject { described_class.new combo_legs: [] }

          no_error
        end

        context "with empty good values" do
          subject { described_class.new combo_legs: [{ ratio: 42, exchange: "str", exempt_code: 23 }] }

          no_error
        end

        context "with wrong ratio" do
          subject { described_class.new combo_legs: [{ ratio: "wrong" }] }

          with_error(message:
                         'invalid value for Integer(): "wrong". Check value of "ratio". Check value of "combo_legs"')
        end

        context "with wrong ratio on one in the collection" do
          subject { described_class.new combo_legs: [{ ratio: 1 }, { ratio: 2 }, { ratio: "wrong" }] }

          with_error(message:
                         'invalid value for Integer(): "wrong". Check value of "ratio". Check value of "combo_legs"')
        end
      end
    end
  end
end
