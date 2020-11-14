# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.OrderState"

class Java::ComIbClient::OrderState
  # Java api is inconsistent so we sadly must to check if we have the setter for each method
  def to_ruby
    ruby_object = InteractiveBrokersCommon::OrderState.new
    ruby_object.status = status().to_ruby if respond_to?(:status)
    ruby_object.init_margin_before = initMarginBefore().to_ruby if respond_to?(:initMarginBefore)
    ruby_object.maint_margin_before = maintMarginBefore().to_ruby if respond_to?(:maintMarginBefore)
    ruby_object.equity_with_loan_before = equityWithLoanBefore().to_ruby if respond_to?(:equityWithLoanBefore)
    ruby_object.init_margin_change = initMarginChange().to_ruby if respond_to?(:initMarginChange)
    ruby_object.maint_margin_change = maintMarginChange().to_ruby if respond_to?(:maintMarginChange)
    ruby_object.equity_with_loan_change = equityWithLoanChange().to_ruby if respond_to?(:equityWithLoanChange)
    ruby_object.init_margin_after = initMarginAfter().to_ruby if respond_to?(:initMarginAfter)
    ruby_object.maint_margin_after = maintMarginAfter().to_ruby if respond_to?(:maintMarginAfter)
    ruby_object.equity_with_loan_after = equityWithLoanAfter().to_ruby if respond_to?(:equityWithLoanAfter)
    ruby_object.commission = commission().to_ruby if respond_to?(:commission)
    ruby_object.min_commission = minCommission().to_ruby if respond_to?(:minCommission)
    ruby_object.max_commission = maxCommission().to_ruby if respond_to?(:maxCommission)
    ruby_object.commission_currency = commissionCurrency().to_ruby if respond_to?(:commissionCurrency)
    ruby_object.warning_text = warningText().to_ruby if respond_to?(:warningText)
    ruby_object.completed_time = completedTime().to_ruby if respond_to?(:completedTime)
    ruby_object.completed_status = completedStatus().to_ruby if respond_to?(:completedStatus)

    ruby_object
  end
end
