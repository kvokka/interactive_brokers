# frozen_string_literal: true

require "mutex_m"

module InteractiveBrokersProxy
  class Registry < Hash
    class RecordAlreadyExists < StandardError; end

    include Mutex_m

    # to maintain uniqueness all data settings should be done with this method
    def add_uniq_record!(key, value)
      synchronize do
        raise RecordAlreadyExists if key? key

        self[key] = value
      end
    end

    private :[]=
  end
end
