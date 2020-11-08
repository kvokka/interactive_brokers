# frozen_string_literal: true

RSpec.describe InteractiveBrokersProxy::Registry do
  subject { described_class.new name: "reg", key_class: Symbol }

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

      it "raises an error if already exist" do
        expect { subject.add_uniq_record!(:foo, 23) }.to raise_error described_class::RecordAlreadyExistsError
      end

      it "raises an error if key class is wrong" do
        expect { subject.add_uniq_record!("string instead of symbol", 23) }.to(
          raise_error described_class::WrongKeyClassError
        )
      end
    end

    context "when calc default value" do
      subject do
        described_class.new(name: "reg", key_class: Symbol) do
          @a ||= "f"
          @a += "o"
        end
      end

      before { subject.add_uniq_record!(:some_key) }

      it { expect(subject[:some_key]).to eq "fo" }

      it("use the same object on the second invocation") do
        subject[:some_key]
        expect(subject[:some_key]).to eq "fo"
      end

      it("use new object with invocation on another key") do
        subject[:some_key]
        expect(subject[:other_key]).to eq "foo"
      end
    end
  end

  describe "#[]=" do
    it "is private" do
      expect(subject.private_methods).to include :[]=
    end
  end

  describe "#name" do
    it("has a name") { expect(subject.name).to eq "reg" }
  end

  describe "#key_class" do
    it("has a key_class") { expect(subject.key_class).to eq Symbol }
  end
end
