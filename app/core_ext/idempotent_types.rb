# frozen_string_literal: true

java_import "java.lang.Enum"
java_import "java.lang.Throwable"

module InteractiveBrokers
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

[String, Integer, Float, NilClass, TrueClass, FalseClass, Throwable].each do |klass|
  klass.include InteractiveBrokers::CoreExt::IdempotentType
end
