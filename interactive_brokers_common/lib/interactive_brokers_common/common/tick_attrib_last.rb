# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokersCommon
  TickAttribLast = Struct.new(:past_limit, :unreported, keyword_init: true) do
    def to_ib
      ib_object = Java::ComIbClient::TickAttribLast.new
      ib_object.pastLimit(!!past_limit).to_java unless past_limit.nil?
      ib_object.unreported(!!unreported).to_java unless unreported.nil?

      ib_object
    end

    def check_value_types!
      current_field = :past_limit
      !!past_limit unless past_limit.nil?
      current_field = :unreported
      !!unreported unless unreported.nil?

      true
    rescue StandardError => e
      raise $ERROR_INFO, e.message.concat(". Check value of \"#{current_field}\""), $ERROR_INFO.backtrace
    end
  end
end
