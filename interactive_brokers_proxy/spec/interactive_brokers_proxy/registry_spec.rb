# frozen_string_literal: true

RSpec.describe InteractiveBrokersProxy::Registry do
  describe "include mutex" do
    context "with unlocked mutex by default" do
      it { is_expected.not_to be_locked }
    end

    context "with locked mutex" do
      before { subject.lock }

      it { is_expected.to be_locked }
    end
  end

  describe "#add_uniq_record!" do
    context "with uniq record" do
      before { subject.add_uniq_record!(:foo, 42) }

      it "does not raise an error" do
        subject.add_uniq_record! :bar, 23
        expect { subject }.not_to raise_error
      end

      it "raises an error" do
        expect { subject.add_uniq_record!(:foo, 23) }.to raise_error described_class::RecordAlreadyExists
      end
    end
  end

  describe "#[]=" do
    it "is private" do
      expect(subject.private_methods).to include :[]=
    end
  end
end
