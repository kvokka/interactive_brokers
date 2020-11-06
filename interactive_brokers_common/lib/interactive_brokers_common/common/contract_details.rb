# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokersCommon
  ContractDetails = Struct.new(:contract, :market_name, :min_tick, :price_magnifier, :order_types, :valid_exchanges, :under_conid, :long_name, :contract_month, :industry, :category, :subcategory, :time_zone_id, :trading_hours, :liquid_hours, :ev_rule, :ev_multiplier, :md_size_multiplier, :sec_id_list, :agg_group, :under_symbol, :under_sec_type, :market_rule_ids, :real_expiration_date, :last_trade_time, :cusip, :ratings, :desc_append, :bond_type, :coupon_type, :callable, :putable, :coupon, :convertible, :maturity, :issue_date, :next_option_date, :next_option_type, :next_option_partial, :notes, keyword_init: true) do
    def to_ib
      ib_object = Java::ComIbClient::ContractDetails.new
      unless contract.nil?
        ib_object.contract((contract.is_a?(Contract) ? contract : Contract.new(contract)).to_ib).to_java
      end
      ib_object.marketName(String(market_name)).to_java unless market_name.nil?
      ib_object.minTick(Float(min_tick)).to_java unless min_tick.nil?
      ib_object.priceMagnifier(Integer(price_magnifier)).to_java unless price_magnifier.nil?
      ib_object.orderTypes(String(order_types)).to_java unless order_types.nil?
      ib_object.validExchanges(String(valid_exchanges)).to_java unless valid_exchanges.nil?
      ib_object.underConid(Integer(under_conid)).to_java unless under_conid.nil?
      ib_object.longName(String(long_name)).to_java unless long_name.nil?
      ib_object.contractMonth(String(contract_month)).to_java unless contract_month.nil?
      ib_object.industry(String(industry)).to_java unless industry.nil?
      ib_object.category(String(category)).to_java unless category.nil?
      ib_object.subcategory(String(subcategory)).to_java unless subcategory.nil?
      ib_object.timeZoneId(String(time_zone_id)).to_java unless time_zone_id.nil?
      ib_object.tradingHours(String(trading_hours)).to_java unless trading_hours.nil?
      ib_object.liquidHours(String(liquid_hours)).to_java unless liquid_hours.nil?
      ib_object.evRule(String(ev_rule)).to_java unless ev_rule.nil?
      ib_object.evMultiplier(Float(ev_multiplier)).to_java unless ev_multiplier.nil?
      ib_object.mdSizeMultiplier(Integer(md_size_multiplier)).to_java unless md_size_multiplier.nil?
      unless sec_id_list.nil?
        ib_object.secIdList((sec_id_list.all? { |e| e.is_a?(TagValue) } ? sec_id_list : sec_id_list.map { |hash| TagValue.new(hash) }).to_ib).to_java
      end
      ib_object.aggGroup(Integer(agg_group)).to_java unless agg_group.nil?
      ib_object.underSymbol(String(under_symbol)).to_java unless under_symbol.nil?
      ib_object.underSecType(String(under_sec_type)).to_java unless under_sec_type.nil?
      ib_object.marketRuleIds(String(market_rule_ids)).to_java unless market_rule_ids.nil?
      ib_object.realExpirationDate(String(real_expiration_date)).to_java unless real_expiration_date.nil?
      ib_object.lastTradeTime(String(last_trade_time)).to_java unless last_trade_time.nil?
      ib_object.cusip(String(cusip)).to_java unless cusip.nil?
      ib_object.ratings(String(ratings)).to_java unless ratings.nil?
      ib_object.descAppend(String(desc_append)).to_java unless desc_append.nil?
      ib_object.bondType(String(bond_type)).to_java unless bond_type.nil?
      ib_object.couponType(String(coupon_type)).to_java unless coupon_type.nil?
      ib_object.callable(!!callable).to_java unless callable.nil?
      ib_object.putable(!!putable).to_java unless putable.nil?
      ib_object.coupon(Float(coupon)).to_java unless coupon.nil?
      ib_object.convertible(!!convertible).to_java unless convertible.nil?
      ib_object.maturity(String(maturity)).to_java unless maturity.nil?
      ib_object.issueDate(String(issue_date)).to_java unless issue_date.nil?
      ib_object.nextOptionDate(String(next_option_date)).to_java unless next_option_date.nil?
      ib_object.nextOptionType(String(next_option_type)).to_java unless next_option_type.nil?
      ib_object.nextOptionPartial(!!next_option_partial).to_java unless next_option_partial.nil?
      ib_object.notes(String(notes)).to_java unless notes.nil?

      ib_object
    end
  end
end
