# frozen_string_literal: true

java_import "java.util.ArrayList"

module InteractiveBrokersCommon
  module CoreExt
    # Extensions to Array for converting between ruby and ib
    module Array
      def to_ib
        collect(&:to_ib)
      end

      def to_ruby
        collect(&:to_ruby)
      end
    end
  end
end

[Array, Java::JavaUtil::ArrayList].each do |array_klass|
  array_klass.send(:include, InteractiveBrokersCommon::CoreExt::Array)
end
