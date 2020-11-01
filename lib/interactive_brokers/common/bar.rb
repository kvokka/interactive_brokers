# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokers
  module Common
    Bar = Struct.new(:time, :open, :high, :low, :close, :volume, :count, :wap, keyword_init: true) do
      def initialize(time: nil, open: nil, high: nil, low: nil, close: nil, volume: nil, count: nil, wap: nil)
        self.time = time
        self.open = open
        self.high = high
        self.low = low
        self.close = close
        self.volume = volume
        self.count = count
        self.wap = wap
      end

      def to_ib
        ib_object = Java::ComIbClient::Bar.new
        ib_object.time(time).to_java unless time.nil?
        ib_object.open(open).to_java unless open.nil?
        ib_object.high(high).to_java unless high.nil?
        ib_object.low(low).to_java unless low.nil?
        ib_object.close(close).to_java unless close.nil?
        ib_object.volume(volume).to_java unless volume.nil?
        ib_object.count(count).to_java unless count.nil?
        ib_object.wap(wap).to_java unless wap.nil?

        ib_object
      end
    end
  end
end
