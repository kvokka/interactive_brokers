# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokersCommon
  Contract = Struct.new(:conid, :symbol, :sec_type, :last_trade_date_or_contract_month, :strike, :right, :multiplier, :exchange, :primary_exch, :currency, :local_symbol, :trading_class, :sec_id_type, :sec_id, :delta_neutral_contract, :include_expired, :combo_legs_descrip, :combo_legs, keyword_init: true) do
    def to_ib
      ib_object = Java::ComIbClient::Contract.new
      ib_object.conid(conid).to_java unless conid.nil?
      ib_object.symbol(symbol).to_java unless symbol.nil?
      ib_object.secType(sec_type).to_java unless sec_type.nil?
      unless last_trade_date_or_contract_month.nil?
        ib_object.lastTradeDateOrContractMonth(last_trade_date_or_contract_month).to_java
      end
      ib_object.strike(strike).to_java unless strike.nil?
      ib_object.right(right).to_java unless right.nil?
      ib_object.multiplier(multiplier).to_java unless multiplier.nil?
      ib_object.exchange(exchange).to_java unless exchange.nil?
      ib_object.primaryExch(primary_exch).to_java unless primary_exch.nil?
      ib_object.currency(currency).to_java unless currency.nil?
      ib_object.localSymbol(local_symbol).to_java unless local_symbol.nil?
      ib_object.tradingClass(trading_class).to_java unless trading_class.nil?
      ib_object.secIdType(sec_id_type).to_java unless sec_id_type.nil?
      ib_object.secId(sec_id).to_java unless sec_id.nil?
      ib_object.deltaNeutralContract(delta_neutral_contract).to_java unless delta_neutral_contract.nil?
      ib_object.includeExpired(include_expired).to_java unless include_expired.nil?
      ib_object.comboLegsDescrip(combo_legs_descrip).to_java unless combo_legs_descrip.nil?
      ib_object.comboLegs(combo_legs).to_java unless combo_legs.nil?

      ib_object
    end
  end
end
