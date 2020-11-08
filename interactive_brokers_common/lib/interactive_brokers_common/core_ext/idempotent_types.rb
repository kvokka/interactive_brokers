# frozen_string_literal: true

java_import "java.lang.Enum"
java_import "java.lang.Throwable"

module InteractiveBrokersCommon
  module CoreExt
    # Extension to convert between ib and ruby for types that can travel seamlessly
    module IdempotentType
      def to_ib
        self
      end

      def to_ruby
        self
      end
    end
  end
end

[String, Hash, Integer, Float, NilClass, TrueClass, FalseClass, Throwable, Java::JavaLang::Object].each do |klass|
  klass.include InteractiveBrokersCommon::CoreExt::IdempotentType
end
