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

    def check_value_types!
      current_field = :time
      String(time) unless time.nil?
      current_field = :open
      Float(open) unless open.nil?
      current_field = :high
      Float(high) unless high.nil?
      current_field = :low
      Float(low) unless low.nil?
      current_field = :close
      Float(close) unless close.nil?
      current_field = :volume
      Integer(volume) unless volume.nil?
      current_field = :count
      Integer(count) unless count.nil?
      current_field = :wap
      Float(wap) unless wap.nil?

      true
    rescue StandardError => e
      raise $ERROR_INFO, e.message.concat(". Check value of \"#{current_field}\""), $ERROR_INFO.backtrace
    end
  end
end
