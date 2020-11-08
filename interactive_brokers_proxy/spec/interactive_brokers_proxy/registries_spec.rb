# frozen_string_literal: true

module InteractiveBrokersProxy
  RSpec.describe self do
    describe "registries" do
      context "with common registry" do
        subject { described_class.common_registry }

        it { is_expected.to be_a Registry }
        it { expect(subject.key_class).to eq Symbol }
      end

      context "with req_id registry" do
        subject { described_class.req_id_registry }

        it { is_expected.to be_a Registry }
        it { expect(subject.key_class).to eq Integer }
      end

      context "with supported_methods_registry registry" do
        subject { described_class.supported_methods_registry }

        it { is_expected.to be_a Registry }
        it { expect(subject.key_class).to eq Symbol }
      end
    end
  end
end
