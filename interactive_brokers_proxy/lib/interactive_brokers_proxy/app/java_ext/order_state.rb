# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.OrderState"

class Java::ComIbClient::OrderState
  def to_ruby
    ruby_object = InteractiveBrokersCommon::OrderState.new
    ruby_object.status = status().to_ruby
    ruby_object.init_margin_before = initMarginBefore().to_ruby
    ruby_object.maint_margin_before = maintMarginBefore().to_ruby
    ruby_object.equity_with_loan_before = equityWithLoanBefore().to_ruby
    ruby_object.init_margin_change = initMarginChange().to_ruby
    ruby_object.maint_margin_change = maintMarginChange().to_ruby
    ruby_object.equity_with_loan_change = equityWithLoanChange().to_ruby
    ruby_object.init_margin_after = initMarginAfter().to_ruby
    ruby_object.maint_margin_after = maintMarginAfter().to_ruby
    ruby_object.equity_with_loan_after = equityWithLoanAfter().to_ruby
    ruby_object.commission = commission().to_ruby
    ruby_object.min_commission = minCommission().to_ruby
    ruby_object.max_commission = maxCommission().to_ruby
    ruby_object.commission_currency = commissionCurrency().to_ruby
    ruby_object.warning_text = warningText().to_ruby
    ruby_object.completed_time = completedTime().to_ruby
    ruby_object.completed_status = completedStatus().to_ruby

    ruby_object
  end
end
