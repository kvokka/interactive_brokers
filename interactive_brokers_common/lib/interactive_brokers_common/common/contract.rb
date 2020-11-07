# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokersCommon
  Contract = Struct.new(:conid, :symbol, :sec_type, :last_trade_date_or_contract_month, :strike, :right, :multiplier, :exchange, :primary_exch, :currency, :local_symbol, :trading_class, :sec_id_type, :sec_id, :delta_neutral_contract, :include_expired, :combo_legs_descrip, :combo_legs, keyword_init: true) do
    def to_ib
      ib_object = Java::ComIbClient::Contract.new
      ib_object.conid(Integer(conid)).to_java unless conid.nil?
      ib_object.symbol(String(symbol)).to_java unless symbol.nil?
      ib_object.secType(String(sec_type)).to_java unless sec_type.nil?
      unless last_trade_date_or_contract_month.nil?
        ib_object.lastTradeDateOrContractMonth(String(last_trade_date_or_contract_month)).to_java
      end
      ib_object.strike(Float(strike)).to_java unless strike.nil?
      ib_object.right(String(right)).to_java unless right.nil?
      ib_object.multiplier(String(multiplier)).to_java unless multiplier.nil?
      ib_object.exchange(String(exchange)).to_java unless exchange.nil?
      ib_object.primaryExch(String(primary_exch)).to_java unless primary_exch.nil?
      ib_object.currency(String(currency)).to_java unless currency.nil?
      ib_object.localSymbol(String(local_symbol)).to_java unless local_symbol.nil?
      ib_object.tradingClass(String(trading_class)).to_java unless trading_class.nil?
      ib_object.secIdType(String(sec_id_type)).to_java unless sec_id_type.nil?
      ib_object.secId(String(sec_id)).to_java unless sec_id.nil?
      unless delta_neutral_contract.nil?
        ib_object.deltaNeutralContract((delta_neutral_contract.is_a?(DeltaNeutralContract) ? delta_neutral_contract : DeltaNeutralContract.new(delta_neutral_contract)).to_ib).to_java
      end
      ib_object.includeExpired(!!include_expired).to_java unless include_expired.nil?
      ib_object.comboLegsDescrip(String(combo_legs_descrip)).to_java unless combo_legs_descrip.nil?
      unless combo_legs.nil?
        ib_object.comboLegs((combo_legs.all? { |e| e.is_a?(ComboLeg) } ? combo_legs : combo_legs.map { |hash| ComboLeg.new(hash) }).to_ib).to_java
      end

      ib_object
    end

    def check_value_types!
      current_field = :conid
      Integer(conid) unless conid.nil?
      current_field = :symbol
      String(symbol) unless symbol.nil?
      current_field = :sec_type
      String(sec_type) unless sec_type.nil?
      current_field = :last_trade_date_or_contract_month
      String(last_trade_date_or_contract_month) unless last_trade_date_or_contract_month.nil?
      current_field = :strike
      Float(strike) unless strike.nil?
      current_field = :right
      String(right) unless right.nil?
      current_field = :multiplier
      String(multiplier) unless multiplier.nil?
      current_field = :exchange
      String(exchange) unless exchange.nil?
      current_field = :primary_exch
      String(primary_exch) unless primary_exch.nil?
      current_field = :currency
      String(currency) unless currency.nil?
      current_field = :local_symbol
      String(local_symbol) unless local_symbol.nil?
      current_field = :trading_class
      String(trading_class) unless trading_class.nil?
      current_field = :sec_id_type
      String(sec_id_type) unless sec_id_type.nil?
      current_field = :sec_id
      String(sec_id) unless sec_id.nil?
      current_field = :delta_neutral_contract
      unless delta_neutral_contract.nil?
        (delta_neutral_contract.is_a?(DeltaNeutralContract) ? delta_neutral_contract : DeltaNeutralContract.new(delta_neutral_contract)).check_value_types!
      end
      current_field = :include_expired
      !!include_expired unless include_expired.nil?
      current_field = :combo_legs_descrip
      String(combo_legs_descrip) unless combo_legs_descrip.nil?
      current_field = :combo_legs
      unless combo_legs.nil?
        (combo_legs.all? { |e| e.is_a?(ComboLeg) } ? combo_legs : combo_legs.map { |hash| ComboLeg.new(hash) }).each(&:check_value_types!)
      end

      true
    rescue StandardError => e
      raise $ERROR_INFO, e.message.concat(". Check value of \"#{current_field}\""), $ERROR_INFO.backtrace
    end
  end
end
