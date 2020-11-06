# frozen_string_literal: true

require_relative "ib_field"

module InteractiveBrokersGenerator
  module Reflection
    # An ib class
    class IbClass
      attr_reader :klass

      # @param [Class] klass
      def initialize(klass)
        @klass = klass
      end

      # The class name without including namespaces
      #
      # @return [String]
      def name
        klass.name.split("::").last
      end

      # The full qualified class name including namespace
      #
      # @return [Object]
      def full_name
        klass.name
      end

      # List of ib fields that represent properties to interchange
      #
      # @return [Array<IbField>]
      def java_property_fields
        @java_property_fields ||= java_fields.collect { |field| IbField.new(field, self) }
      end

      # List of ruby properties names that correspond to {#java_property_fields}
      #
      # @return [Array<String>]
      def ruby_property_names
        @ruby_property_names ||= java_property_fields.collect do |field|
          field.name.underscore
        end
      end

      # Return an array of combinations of {#ruby_property_names} and #{java_property_fields}
      #
      # @return [Array<Array<String, IbField>>]
      def zipped_ruby_and_java_properties
        ruby_property_names.zip(java_property_fields)
      end

      # Return a hash with a method name, where method name of a List getter is a key,
      # and java class name string as a value, which is a type if this List
      # it should be better way than this hack, but i did not find it
      #
      # @return [Hash<String, String>]
      def list_types
        @list_types ||= klass.java_class.declared_instance_methods.each_with_object({}) do |method, acc|
          type = method.to_generic_string.match(/.*\(java\.util\.List<com\.ib\.client\.(\w+)>\)$/)&.captures&.first
          next unless type

          acc[method.name] = type
        end
      end

      private

      def java_fields
        @java_fields ||= klass.java_class.declared_fields.find_all do |field|
          field.name =~ IbField::IB_FIELD_PREFIX
        end
      end
    end
  end
end
