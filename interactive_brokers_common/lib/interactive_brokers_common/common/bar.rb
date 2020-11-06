# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokersCommon
  Bar = Struct.new(:time, :open, :high, :low, :close, :volume, :count, :wap, keyword_init: true) do
    def to_ib
      ib_object = Java::ComIbClient::Bar.new
      ib_object.time(String(time)).to_java unless time.nil?
      ib_object.open(Float(open)).to_java unless open.nil?
      ib_object.high(Float(high)).to_java unless high.nil?
      ib_object.low(Float(low)).to_java unless low.nil?
      ib_object.close(Float(close)).to_java unless close.nil?
      ib_object.volume(Integer(volume)).to_java unless volume.nil?
      ib_object.count(Integer(count)).to_java unless count.nil?
      ib_object.wap(Float(wap)).to_java unless wap.nil?

      ib_object
    end
  end
end
