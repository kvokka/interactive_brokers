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
      observer&.register(name)
      super(*args)
    end

    def find_or_register(key, value = nil)
      self[key] || register(key, value)
    end

    # to maintain uniqueness all data settings should be done with this method
    def register(key, value = nil)
      unless key.is_a? key_class
        raise(WrongKeyClassError, "Registry '#{name}' accept keys with class #{key_class} got #{key.class}")
      end

      synchronize do
        raise(RecordAlreadyExistsError, "Record with key '#{key}' in registry '#{name}' already exist") if key? key

        self[key] = value || default_proc&.call || raise(ValueNotSetError)
      end
    end

    # Remove value from registry
    # if single argument is given act as #delete method
    # accepts 2nd optional argument is a guard which allows to check that the value
    # is still the same
    # if the value was changed- nil will be returned
    def unregister(key, old_value = nil)
      synchronize do
        next delete(key) if old_value.nil?
        next unless self[key] == old_value

        delete(key)
      end
    end

    private :[]=, :merge!, :transform_keys!, :delete, :delete_if
  end
end
