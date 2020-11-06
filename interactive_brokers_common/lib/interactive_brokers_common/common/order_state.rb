# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokersCommon
  OrderState = Struct.new(:status, :init_margin_before, :maint_margin_before, :equity_with_loan_before, :init_margin_change, :maint_margin_change, :equity_with_loan_change, :init_margin_after, :maint_margin_after, :equity_with_loan_after, :commission, :min_commission, :max_commission, :commission_currency, :warning_text, :completed_time, :completed_status, keyword_init: true) do
    def to_ib
      ib_object = Java::ComIbClient::OrderState.new
      ib_object.status(String(status)).to_java unless status.nil?
      ib_object.initMarginBefore(String(init_margin_before)).to_java unless init_margin_before.nil?
      ib_object.maintMarginBefore(String(maint_margin_before)).to_java unless maint_margin_before.nil?
      ib_object.equityWithLoanBefore(String(equity_with_loan_before)).to_java unless equity_with_loan_before.nil?
      ib_object.initMarginChange(String(init_margin_change)).to_java unless init_margin_change.nil?
      ib_object.maintMarginChange(String(maint_margin_change)).to_java unless maint_margin_change.nil?
      ib_object.equityWithLoanChange(String(equity_with_loan_change)).to_java unless equity_with_loan_change.nil?
      ib_object.initMarginAfter(String(init_margin_after)).to_java unless init_margin_after.nil?
      ib_object.maintMarginAfter(String(maint_margin_after)).to_java unless maint_margin_after.nil?
      ib_object.equityWithLoanAfter(String(equity_with_loan_after)).to_java unless equity_with_loan_after.nil?
      ib_object.commission(Float(commission)).to_java unless commission.nil?
      ib_object.minCommission(Float(min_commission)).to_java unless min_commission.nil?
      ib_object.maxCommission(Float(max_commission)).to_java unless max_commission.nil?
      ib_object.commissionCurrency(String(commission_currency)).to_java unless commission_currency.nil?
      ib_object.warningText(String(warning_text)).to_java unless warning_text.nil?
      ib_object.completedTime(String(completed_time)).to_java unless completed_time.nil?
      ib_object.completedStatus(String(completed_status)).to_java unless completed_status.nil?

      ib_object
    end
  end
end
