# frozen_string_literal: true

module InteractiveBrokers
  module CoreExt
    module Struct
      def attributes
        new.to_h.keys
      end
    end
  end
end

Struct.extend InteractiveBrokers::CoreExt::Struct
