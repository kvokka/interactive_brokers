# frozen_string_literal: true

require_relative "reflection/ib_class"

module InteractiveBrokersGenerator
  # Given a value object class from Interactive Broker API, this generator can build Ruby source
  # code for:
  #
  # * A ruby class to manipulate the same class in Ruby
  # * An extension to the original Java class for converting instances into Ruby
  class ClassSourceGenerator
    attr_reader :ib_class, :namespace_list

    # @param [Class] ib_class Class from IB broker to mimic in Ruby. It is meant to be used with
    #   value objects, as only properties are translated. That is the case for classes that
    #   represent either arguments or returned values (via callbacks) in the API.
    # @param [String] namespace The namespace to generate the classes in. Default
    #   +IbRubyProxy::Client::Ib+
    def initialize(ib_class, namespace: "InteractiveBrokersCommon")
      @ib_class = Reflection::IbClass.new(ib_class)
      @namespace_list = namespace.split("::")
    end

    # Source for a ruby class translates into Ruby the Java properties of the target
    # ib class.
    #
    # It generates a {Struct} with the list of properties, that admits a keyword-based
    # constructor, and that includes a +to_ib+ method for converting the ruby back into its
    # original Java counterpart.
    #
    # @return [String]
    def ruby_class_source
      <<-RUBY
        #{header}

        #{generate_ruby_class}
      RUBY
    end

    # Source for a ruby class that extends the original IB Java class with a +to_ruby+ method,
    # to convert Java Ib objects into their Ruby counterparts generated in {#ruby_class_source}
    #
    # @return [String]
    def ib_class_extension_source
      <<-RUBY
        #{header}

        #{generate_ib_class_extension}
      RUBY
    end

    private

    def header
      <<-RUBY
        # ---------------------------------------------
        # File generated automatically by interactive_brokers gem
        # ---------------------------------------------
      RUBY
    end

    def generate_ib_class_extension
      <<-RUBY
        java_import "com.ib.client.#{ib_class.name}"

        class #{ib_class.full_name}
          #{generate_to_ruby_method}
        end
      RUBY
    end

    def generate_ruby_class
      <<-RUBY
        #{generate_namespace_open}

        #{generate_class_declaration}
          #{generate_to_ib_method}

          #{generate_check_value_types_method}
        end

        #{generate_namespace_close}
      RUBY
    end

    def generate_namespace_open
      namespace_list.collect { |namespace| "module #{namespace}" }.join("\n")
    end

    def generate_namespace_close
      namespace_list.length.times.collect { "end" }.join("\n")
    end

    def generate_class_declaration
      struct_init_properties = ib_class.ruby_property_names.collect { |property| ":#{property}" }
                                       .join(", ")
      struct_init_properties << ", keyword_init: true"

      <<-RUBY
          #{ib_class.name} = Struct.new(#{struct_init_properties}) do
      RUBY
    end

    def generate_check_value_types_method
      property_copy_sentences = ib_class.java_property_fields.map do |java_field|
        next "# Java method '#{java_field.name}' does not have setter/getter\n" unless java_field.has_setter?

        <<-RUBY
          #{java_field.to_eval_ruby} unless #{java_field.ruby_name}.nil?
        RUBY
      end

      <<-RUBY
        def check_value_types!
          #{property_copy_sentences.join('')}
          true
        end
      RUBY
    end

    def generate_to_ib_method
      property_copy_sentences = ib_class.java_property_fields.map do |java_field|
        next "# Java method '#{java_field.name}' does not have setter/getter\n" unless java_field.has_setter?

        <<-RUBY
          ib_object.#{java_field.name}(#{java_field.to_eval_jruby}).to_java unless #{java_field.ruby_name}.nil?
        RUBY
      end

      <<-RUBY
        def to_ib
          ib_object = #{ib_class.klass.name}.new
          #{property_copy_sentences.join('')}
          ib_object
        end
      RUBY
    end

    def generate_to_ruby_method
      property_copy_sentences = ib_class.zipped_ruby_and_java_properties
                                        .collect do |ruby_property, java_field|
        <<-RUBY
          ruby_object.#{ruby_property} = #{java_field.name}().to_ruby
        RUBY
      end

      <<-RUBY
        def to_ruby
          ruby_object = #{namespace_list.join('::')}::#{ib_class.name}.new
          #{property_copy_sentences.join('')}
          ruby_object
        end
      RUBY
    end
  end
end
