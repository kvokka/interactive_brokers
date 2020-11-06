# frozen_string_literal: true

java_import "com.ib.client.Contract"
java_import "com.ib.client.ComboLeg"
require "interactive_brokers_generator/reflection/ib_class"
require "jruby/core_ext"

module InteractiveBrokersGenerator
  module Reflection
    RSpec.describe IbField do
      subject { described_class.new java_field, ib_class }

      let(:ib_class) { IbClass.new(Java::ComIbClient::Contract) }
      let(:java_field) { ib_class.java_property_fields.find { |field| field.name == java_field_name }.java_field }
      let(:java_field_name) { "lastTradeDateOrContractMonth" }

      describe "#name" do
        it "returns the accessor name even when the property field uses a different case" do
          # the underlying field is m_lastTradedateOrContractMonth
          expect(subject.name).to eq(java_field_name)
        end
      end

      describe "#ruby_name" do
        it "provide proper ruby name" do
          expect(subject.ruby_name).to eq("last_trade_date_or_contract_month")
        end
      end

      describe "has_setter?" do
        it { expect(subject).to have_setter }

        context "with out setter" do
          let(:ib_class) { IbClass.new(Java::ComIbClient::TagValue) }
          let(:java_field_name) { "tag" }

          it { expect(subject).not_to have_setter }
        end
      end

      # rubocop:disable RSpec/MultipleMemoizedHelpers
      describe "#name_with_coercion" do
        let(:name) { "fieldName" }
        let(:ruby_name) { name.underscore }

        context "with string" do
          let(:java_field) { instance_double(Java::JavaField, value_type: "java.lang.String", name: name) }

          it { expect(subject.name_with_coercion).to eq "String(#{ruby_name})" }
        end

        context "with integer" do
          %w[int long].each do |value_type|
            let(:java_field) { instance_double(Java::JavaField, value_type: value_type, name: name) }

            it("for #{value_type}") { expect(subject.name_with_coercion).to eq "Integer(#{ruby_name})" }
          end
        end

        context "with float" do
          let(:java_field) { instance_double(Java::JavaField, value_type: "double", name: name) }

          it { expect(subject.name_with_coercion).to eq "Float(#{ruby_name})" }
        end

        context "with boolean" do
          %w[boolean java.lang.Boolean].each do |value_type|
            let(:java_field) { instance_double(Java::JavaField, value_type: value_type, name: name) }

            it("for #{value_type}") { expect(subject.name_with_coercion).to eq "!!#{ruby_name}" }
          end
        end

        context "with java object" do
          let(:type) { instance_double("java class", ruby_class: Java::ComIbClient::DeltaNeutralContract) }
          let(:java_field) do
            instance_double(Java::JavaField, type: type, value_type: "com.ib.client.Contract", name: name)
          end
          let(:result) do
            "(#{ruby_name}.is_a?(DeltaNeutralContract) ? #{ruby_name} : DeltaNeutralContract.new(#{ruby_name})).to_ib"
          end

          it { expect(subject.name_with_coercion).to eq result }
        end

        context "with java.util.List" do
          let(:java_field) { instance_double(Java::JavaField,  value_type: "java.util.List", name: name) }

          context "with out method in ib class" do
            before do
              allow(ib_class).to receive(:list_types).and_return({})
            end

            it { expect { subject.name_with_coercion }.to raise_error RuntimeError }
          end

          context "with corresponding method in ib_class" do
            before do
              allow(ib_class).to receive(:list_types).and_return({ "fieldName" => "ResultingKlass" })
            end

            let(:result) do
              "(field_name.all?{|e| e.is_a?(ResultingKlass)} ? field_name : "\
              "field_name.map{|hash| ResultingKlass.new(hash) }).to_ib"
            end

            it { expect(subject.name_with_coercion).to eq result }
          end
        end

        context "with unsupported type" do
          let(:java_field) { instance_double(Java::JavaField, value_type: "unsupported_type", name: name) }

          it { expect { subject.name_with_coercion }.to raise_error RuntimeError }
        end
      end
      # rubocop:enable RSpec/MultipleMemoizedHelpers
    end
  end
end
