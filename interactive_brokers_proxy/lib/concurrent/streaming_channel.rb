# frozen_string_literal: true

require "concurrent-edge"

# details at https://github.com/ruby-concurrency/concurrent-ruby/issues/895
module Concurrent
  class StreamingChannel < Channel
    # Array, where each element must respond_to :call
    def after_each_callbacks
      @after_each_callbacks ||= []
    end

    # After first data out we mark the stream as started.
    # This allows to determine in other threads which channels should be killed as inactive
    def each
      raise ArgumentError, "no block given" unless block_given?

      item, more = do_next
      yield(item) unless item == Concurrent::NULL
      return unless more

      started!
      super
    ensure
      after_each_callbacks.each { |cb| cb.call(self) }
    end

    # if we processed at least something, we assume, that the streaming process
    # initiated correctly, otherwise
    def started!
      @stream_started = true
    end

    def started?
      !!@stream_started
    end
  end
end
