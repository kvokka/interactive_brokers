# frozen_string_literal: true

module InteractiveBrokersCommon
  module CoreExt
    module Struct
      def attributes
        new.to_h.keys
      end
    end
  end
end

Struct.extend InteractiveBrokersCommon::CoreExt::Struct
