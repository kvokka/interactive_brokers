# frozen_string_literal: true

module InteractiveBrokersCommon
  module CoreExt
    module Struct
      def attributes
        new.to_h.keys
      end

      def to_ib
        raise NotImplementedError, "Struct must be parsed trough corresponding parser instead"
      end

      def to_ruby
        self
      end
    end
  end
end

Struct.extend InteractiveBrokersCommon::CoreExt::Struct
