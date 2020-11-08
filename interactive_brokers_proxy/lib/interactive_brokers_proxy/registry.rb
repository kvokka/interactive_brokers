# frozen_string_literal: true

require "mutex_m"

module InteractiveBrokersProxy
  class Registry < Hash
    class RecordAlreadyExistsError < StandardError; end
    class WrongKeyClassError < StandardError; end
    class ValueNotSetError < StandardError; end

    include Mutex_m

    attr_reader :name, :key_class

    def initialize(*args, key_class:, name:, observer: nil)
      @name = name
      @key_class = key_class
      observer&.add_uniq_record!(name)
      super(*args)
    end

    # to maintain uniqueness all data settings should be done with this method
    def add_uniq_record!(key, value = nil)
      unless key.is_a? key_class
        raise(WrongKeyClassError, "Registry '#{name}' accept keys with class #{key_class} got #{key.class}")
      end

      synchronize do
        raise(RecordAlreadyExistsError, "Record with key '#{key}' in registry '#{name}' already exist") if key? key

        self[key] = value || default_proc&.call || raise(ValueNotSetError)
      end
    end

    private :[]=, :merge!, :transform_keys!
  end
end
