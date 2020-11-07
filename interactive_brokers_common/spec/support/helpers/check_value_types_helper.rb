# frozen_string_literal: true

module RSpec
  module Helpers
    module CheckValueTypes
      def no_error
        it { expect { subject.check_value_types! }.not_to raise_error }
      end

      def with_error(klass: ArgumentError, message: nil)
        it { expect { subject.check_value_types! }.to raise_error(klass).with_message(message) }
      end
    end
  end

  configure do |config|
    config.extend Helpers::CheckValueTypes
  end
end
