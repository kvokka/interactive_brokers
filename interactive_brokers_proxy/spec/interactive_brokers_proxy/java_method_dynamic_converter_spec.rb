# frozen_string_literal: true

RSpec.describe InteractiveBrokersProxy::JavaMethodDynamicConverter do
  subject { described_class.new action_name }

  let(:action_name) { "reqStuff" }
  let(:java_method) { instance_double(Java::JavaMethod, name: action_name) }
  let(:another_java_method) { instance_double(Java::JavaMethod, name: "something") }
  let(:actions) { [another_java_method, java_method] }

  before do
    allow(described_class).to receive(:all_actions).and_return(actions)
  end

  describe "#intialize" do
    context("with existed method") do
      it { expect(subject.api_action).to eq java_method }
    end

    context("with not existed method") do
      subject { described_class.new "notExist" }

      it { expect { subject }.to raise_error described_class::NotFoundError }
    end
  end

  describe "#convert" do
    let(:java_method) { instance_double(Java::JavaMethod, name: "reqStuff", parameter_types: parameter_types) }

    context "with 1 string arg" do
      let(:parameter_types) do
        [instance_double("java_parameters", canonical_name: "java.lang.String")]
      end

      it { expect(subject.convert("foo")).to eq ["foo"] }
      it { expect(subject.convert(42)).to eq ["42"] }
      it { expect(subject.convert(nil)).to eq [""] }
      it { expect(subject.convert(false)).to eq ["false"] }
      it { expect(subject.convert(true)).to eq ["true"] }
    end

    %w[int long].each do |java_canonical_type|
      context "with 1 #{java_canonical_type} arg" do
        let(:parameter_types) do
          [instance_double("java_parameters", canonical_name: java_canonical_type)]
        end
        let(:error_message) do
          'invalid value for Integer(): "42ololo". Check value at position "1"'
        end

        it { expect(subject.convert("42")).to eq [42] }
        it { expect(subject.convert(42)).to eq [42] }
        it { expect { subject.convert("42ololo") }.to raise_error(ArgumentError).with_message(error_message) }
      end
    end

    context "with 1 double arg" do
      let(:parameter_types) do
        [instance_double("java_parameters", canonical_name: "double")]
      end
      let(:error_message) do
        'invalid value for Float(): "42.23ololo". Check value at position "1"'
      end

      it { expect(subject.convert("42.23")).to eq [42.23] }
      it { expect(subject.convert(42.23)).to eq [42.23] }
      it { expect { subject.convert("42.23ololo") }.to raise_error(ArgumentError).with_message(error_message) }
    end

    %w[boolean java.lang.Boolean].each do |java_canonical_type|
      context "with 1 #{java_canonical_type} arg" do
        let(:parameter_types) do
          [instance_double("java_parameters", canonical_name: java_canonical_type)]
        end

        it { expect(subject.convert("0")).to eq [false] }
        it { expect(subject.convert(0)).to eq [false] }
        it { expect(subject.convert("f")).to eq [false] }
        it { expect(subject.convert("false")).to eq [false] }
        it { expect(subject.convert(false)).to eq [false] }
        it { expect(subject.convert(nil)).to eq [false] }
        it { expect(subject.convert(1)).to eq [true] }
        it { expect(subject.convert("foo")).to eq [true] }
        it { expect(subject.convert(:baz)).to eq [true] }
      end
    end

    # we test it against real java Contract class cos i dot not see any reason to stub it
    context "with 1 com.ib.client.Contract arg" do
      let(:parameter_types) do
        [instance_double("java_parameters", canonical_name: "com.ib.client.Contract")]
      end
      let(:error_message) do
        'invalid value for Integer(): "foo". Check value of "conid". Check value at position "1"'
      end

      it { expect(subject.convert({})).to all(be_a InteractiveBrokersCommon::Contract) }
      it { expect { subject.convert({ conid: "foo" }) }.to raise_error(ArgumentError).with_message(error_message) }

      context "with sample contract" do
        let(:sample_contract) { { conid: 42, primary_exch: "BATS", strike: 42.42 } }

        it { expect(subject.convert(sample_contract).first.conid).to eq 42 }
        it { expect(subject.convert(sample_contract).first.primary_exch).to eq "BATS" }
        it { expect(subject.convert(sample_contract).first.strike).to eq 42.42 }
      end

      context "with wrong key" do
        let(:sample_contract) { { wrongKey: true } }

        let(:error_message) do
          'unknown keywords: wrongKey. Check value at position "1"'
        end

        it { expect { subject.convert(sample_contract) }.to raise_error(ArgumentError).with_message(error_message) }
      end
    end

    context "with multiple values" do
      let(:parameter_types) do
        [
          instance_double("java_parameters", canonical_name: "int"),
          instance_double("java_parameters", canonical_name: "java.lang.String"),
          instance_double("java_parameters", canonical_name: "double"),
          instance_double("java_parameters", canonical_name: "com.ib.client.Contract")
        ]
      end
      let(:result) { subject.convert(api_function_args) }

      context "with correct data" do
        let(:api_function_args) { ["42", "foo", "1.25", { conid: 42 }] }

        it { expect(result.first).to eq 42 }
        it { expect(result.second).to eq "foo" }
        it { expect(result.third).to eq 1.25 }
        it { expect(result.fourth).to be_a InteractiveBrokersCommon::Contract }
      end

      context "with incorrect data" do
        let(:api_function_args) { ["42", "foo", "1.25", { wrongKey: 42 }] }

        let(:error_message) do
          'unknown keywords: wrongKey. Check value at position "4"'
        end

        it { expect { result }.to raise_error(ArgumentError).with_message(error_message) }
      end
    end
  end
end
