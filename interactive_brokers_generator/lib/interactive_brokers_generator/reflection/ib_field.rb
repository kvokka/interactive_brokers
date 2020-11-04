# frozen_string_literal: true

module InteractiveBrokersGenerator
  module Reflection
    # An {IbClass} field
    class IbField
      IB_FIELD_PREFIX = /^m_/.freeze

      attr_reader :java_field, :ib_class

      def initialize(java_field, ib_class)
        @java_field = java_field
        @ib_class = ib_class
      end

      # Return the name of the accessor method used to access the field
      #
      # @return [String]
      def name
        @name ||= find_name
      end

      private

      def find_name
        field_name_without_prefix = java_field.name.sub(IB_FIELD_PREFIX, "")
        matched_method = ib_class.klass.java_class.declared_instance_methods.find do |method|
          method.name.underscore == field_name_without_prefix.underscore
        end
        raise "No method matching '#{field.name}'?" unless matched_method

        matched_method.name
      end
    end
  end
end
