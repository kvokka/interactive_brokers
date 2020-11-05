# frozen_string_literal: true

require "mutex_m"

module InteractiveBrokersProxy
  class Registry < Hash
    class RecordAlreadyExistsError < StandardError; end
    class WrongKeyClassError < StandardError; end

    include Mutex_m

    attr_reader :name, :key_class

    def initialize(*args, key_class:, name:)
      @name = name
      @key_class = key_class
      super(*args)
    end

    # to maintain uniqueness all data settings should be done with this method
    def add_uniq_record!(key, value)
      synchronize do
        raise RecordAlreadyExistsError if key? key
        raise WrongKeyClassError unless key.is_a? key_class

        self[key] = value
      end
    end

    private :[]=, :merge!, :transform_keys!
  end
end
