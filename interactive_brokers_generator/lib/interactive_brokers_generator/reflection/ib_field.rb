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
        @name = java_field.name.sub(IB_FIELD_PREFIX, "")
      end

      def ruby_name
        name.underscore
      end

      # rubocop:disable Metrics/AbcSize
      # rubocop:disable Metrics/MethodLength
      def name_with_coercion
        case value_type = java_field.value_type
        when "java.lang.String"
          "String(#{ruby_name})"
        when "int", "long"
          "Integer(#{ruby_name})"
        when "double"
          "Float(#{ruby_name})"
        when "boolean", "java.lang.Boolean"
          "!!#{ruby_name}"
        when /^com\.ib\.client\./
          klass = java_field.type.ruby_class.name.demodulize
          "(#{ruby_name}.is_a?(#{klass}) ? #{ruby_name} : #{klass}.new(#{ruby_name})).to_ib"
        when "java.util.List"
          klass = ib_class.list_types[name] || raise("In class #{ib_class.klass} type for List #{name} not found!")
          "(#{ruby_name}.all?{|e| e.is_a?(#{klass})} ? #{ruby_name} : "\
          "#{ruby_name}.map{|hash| #{klass}.new(hash) }).to_ib"
        else
          raise("Unknown type '#{value_type}' for method #{ib_class.klass.name}##{name} ")
        end
      end
      # rubocop:enable Metrics/AbcSize
      # rubocop:enable Metrics/MethodLength

      # rubocop:disable Naming/PredicateName
      def has_setter?
        ib_class.klass.java_class.declared_instance_methods.map(&:name).map(&:underscore).include? name.underscore
      end
      # rubocop:enable Naming/PredicateName
    end
  end
end
