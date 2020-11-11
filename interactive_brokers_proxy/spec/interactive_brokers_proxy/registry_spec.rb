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

  describe "#register" do
    context "with uniq record" do
      before { subject.register(:foo, 42) }

      it "does not raise an error" do
        subject.register :bar, 23
        expect { subject }.not_to raise_error
      end

      it "raises an error if already exist" do
        expect { subject.register(:foo, 23) }.to raise_error described_class::RecordAlreadyExistsError
      end

      it "raises an error if key class is wrong" do
        expect { subject.register("string instead of symbol", 23) }.to(
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

      before { subject.register(:some_key) }

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

  describe "#unregister" do
    before { subject.register(:foo, "bar") }

    context "with 1 argument" do
      it("return removed value") { expect(subject.unregister(:foo)).to eq "bar" }

      it("remove the value") do
        subject.unregister(:foo)
        expect(subject.keys).not_to include :foo
      end
    end

    context "with 2 arguments" do
      context "with second argument match" do
        it("return removed value") { expect(subject.unregister(:foo, "bar")).to eq "bar" }

        it("remove the value") do
          subject.unregister(:foo, "bar")
          expect(subject.keys).not_to include :foo
        end
      end

      context "with second argument not match" do
        it("return nil") { expect(subject.unregister(:foo, "another")).to be_nil }

        it("do not remove the value") do
          subject.unregister(:foo, "another")
          expect(subject[:foo]).to eq "bar"
        end
      end
    end
  end

  %i[[]= merge! transform_keys! delete delete_if].each do |m|
    describe "##{m}" do
      it "is private" do
        expect(subject.private_methods).to include m
      end
    end
  end

  describe "#name" do
    it("has a name") { expect(subject.name).to eq "reg" }
  end

  describe "#key_class" do
    it("has a key_class") { expect(subject.key_class).to eq Symbol }
  end
end
