# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokers
  module Common
    ContractDetails = Struct.new(:contract, :market_name, :min_tick, :price_magnifier, :order_types, :valid_exchanges, :under_conid, :long_name, :contract_month, :industry, :category, :subcategory, :time_zone_id, :trading_hours, :liquid_hours, :ev_rule, :ev_multiplier, :md_size_multiplier, :sec_id_list, :agg_group, :under_symbol, :under_sec_type, :market_rule_ids, :real_expiration_date, :last_trade_time, :cusip, :ratings, :desc_append, :bond_type, :coupon_type, :callable, :putable, :coupon, :convertible, :maturity, :issue_date, :next_option_date, :next_option_type, :next_option_partial, :notes, keyword_init: true) do
      def initialize(contract: nil, market_name: nil, min_tick: nil, price_magnifier: nil, order_types: nil, valid_exchanges: nil, under_conid: nil, long_name: nil, contract_month: nil, industry: nil, category: nil, subcategory: nil, time_zone_id: nil, trading_hours: nil, liquid_hours: nil, ev_rule: nil, ev_multiplier: nil, md_size_multiplier: nil, sec_id_list: nil, agg_group: nil, under_symbol: nil, under_sec_type: nil, market_rule_ids: nil, real_expiration_date: nil, last_trade_time: nil, cusip: nil, ratings: nil, desc_append: nil, bond_type: nil, coupon_type: nil, callable: nil, putable: nil, coupon: nil, convertible: nil, maturity: nil, issue_date: nil, next_option_date: nil, next_option_type: nil, next_option_partial: nil, notes: nil)
        self.contract = contract
        self.market_name = market_name
        self.min_tick = min_tick
        self.price_magnifier = price_magnifier
        self.order_types = order_types
        self.valid_exchanges = valid_exchanges
        self.under_conid = under_conid
        self.long_name = long_name
        self.contract_month = contract_month
        self.industry = industry
        self.category = category
        self.subcategory = subcategory
        self.time_zone_id = time_zone_id
        self.trading_hours = trading_hours
        self.liquid_hours = liquid_hours
        self.ev_rule = ev_rule
        self.ev_multiplier = ev_multiplier
        self.md_size_multiplier = md_size_multiplier
        self.sec_id_list = sec_id_list
        self.agg_group = agg_group
        self.under_symbol = under_symbol
        self.under_sec_type = under_sec_type
        self.market_rule_ids = market_rule_ids
        self.real_expiration_date = real_expiration_date
        self.last_trade_time = last_trade_time
        self.cusip = cusip
        self.ratings = ratings
        self.desc_append = desc_append
        self.bond_type = bond_type
        self.coupon_type = coupon_type
        self.callable = callable
        self.putable = putable
        self.coupon = coupon
        self.convertible = convertible
        self.maturity = maturity
        self.issue_date = issue_date
        self.next_option_date = next_option_date
        self.next_option_type = next_option_type
        self.next_option_partial = next_option_partial
        self.notes = notes
      end

      def to_ib
        ib_object = Java::ComIbClient::ContractDetails.new
        ib_object.contract(contract).to_java unless contract.nil?
        ib_object.marketName(market_name).to_java unless market_name.nil?
        ib_object.minTick(min_tick).to_java unless min_tick.nil?
        ib_object.priceMagnifier(price_magnifier).to_java unless price_magnifier.nil?
        ib_object.orderTypes(order_types).to_java unless order_types.nil?
        ib_object.validExchanges(valid_exchanges).to_java unless valid_exchanges.nil?
        ib_object.underConid(under_conid).to_java unless under_conid.nil?
        ib_object.longName(long_name).to_java unless long_name.nil?
        ib_object.contractMonth(contract_month).to_java unless contract_month.nil?
        ib_object.industry(industry).to_java unless industry.nil?
        ib_object.category(category).to_java unless category.nil?
        ib_object.subcategory(subcategory).to_java unless subcategory.nil?
        ib_object.timeZoneId(time_zone_id).to_java unless time_zone_id.nil?
        ib_object.tradingHours(trading_hours).to_java unless trading_hours.nil?
        ib_object.liquidHours(liquid_hours).to_java unless liquid_hours.nil?
        ib_object.evRule(ev_rule).to_java unless ev_rule.nil?
        ib_object.evMultiplier(ev_multiplier).to_java unless ev_multiplier.nil?
        ib_object.mdSizeMultiplier(md_size_multiplier).to_java unless md_size_multiplier.nil?
        ib_object.secIdList(sec_id_list).to_java unless sec_id_list.nil?
        ib_object.aggGroup(agg_group).to_java unless agg_group.nil?
        ib_object.underSymbol(under_symbol).to_java unless under_symbol.nil?
        ib_object.underSecType(under_sec_type).to_java unless under_sec_type.nil?
        ib_object.marketRuleIds(market_rule_ids).to_java unless market_rule_ids.nil?
        ib_object.realExpirationDate(real_expiration_date).to_java unless real_expiration_date.nil?
        ib_object.lastTradeTime(last_trade_time).to_java unless last_trade_time.nil?
        ib_object.cusip(cusip).to_java unless cusip.nil?
        ib_object.ratings(ratings).to_java unless ratings.nil?
        ib_object.descAppend(desc_append).to_java unless desc_append.nil?
        ib_object.bondType(bond_type).to_java unless bond_type.nil?
        ib_object.couponType(coupon_type).to_java unless coupon_type.nil?
        ib_object.callable(callable).to_java unless callable.nil?
        ib_object.putable(putable).to_java unless putable.nil?
        ib_object.coupon(coupon).to_java unless coupon.nil?
        ib_object.convertible(convertible).to_java unless convertible.nil?
        ib_object.maturity(maturity).to_java unless maturity.nil?
        ib_object.issueDate(issue_date).to_java unless issue_date.nil?
        ib_object.nextOptionDate(next_option_date).to_java unless next_option_date.nil?
        ib_object.nextOptionType(next_option_type).to_java unless next_option_type.nil?
        ib_object.nextOptionPartial(next_option_partial).to_java unless next_option_partial.nil?
        ib_object.notes(notes).to_java unless notes.nil?

        ib_object
      end
    end
  end
end
