# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.Contract"

class Java::ComIbClient::Contract
  # Java api is inconsistent so we sadly must to check if we have the setter for each method
  def to_ruby
    ruby_object = InteractiveBrokersCommon::Contract.new
    ruby_object.conid = conid().to_ruby if respond_to?(:conid)
    ruby_object.symbol = symbol().to_ruby if respond_to?(:symbol)
    ruby_object.sec_type = secType().to_ruby if respond_to?(:secType)
    if respond_to?(:lastTradeDateOrContractMonth)
      ruby_object.last_trade_date_or_contract_month = lastTradeDateOrContractMonth().to_ruby
    end
    ruby_object.strike = strike().to_ruby if respond_to?(:strike)
    ruby_object.right = right().to_ruby if respond_to?(:right)
    ruby_object.multiplier = multiplier().to_ruby if respond_to?(:multiplier)
    ruby_object.exchange = exchange().to_ruby if respond_to?(:exchange)
    ruby_object.primary_exch = primaryExch().to_ruby if respond_to?(:primaryExch)
    ruby_object.currency = currency().to_ruby if respond_to?(:currency)
    ruby_object.local_symbol = localSymbol().to_ruby if respond_to?(:localSymbol)
    ruby_object.trading_class = tradingClass().to_ruby if respond_to?(:tradingClass)
    ruby_object.sec_id_type = secIdType().to_ruby if respond_to?(:secIdType)
    ruby_object.sec_id = secId().to_ruby if respond_to?(:secId)
    ruby_object.delta_neutral_contract = deltaNeutralContract().to_ruby if respond_to?(:deltaNeutralContract)
    ruby_object.include_expired = includeExpired().to_ruby if respond_to?(:includeExpired)
    ruby_object.combo_legs_descrip = comboLegsDescrip().to_ruby if respond_to?(:comboLegsDescrip)
    ruby_object.combo_legs = comboLegs().to_ruby if respond_to?(:comboLegs)

    ruby_object
  end
end
