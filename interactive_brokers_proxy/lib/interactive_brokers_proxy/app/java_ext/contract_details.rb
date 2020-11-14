# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.ContractDetails"

class Java::ComIbClient::ContractDetails
  # Java api is inconsistent so we sadly must to check if we have the setter for each method
  def to_ruby
    ruby_object = InteractiveBrokersCommon::ContractDetails.new
    ruby_object.contract = contract().to_ruby if respond_to?(:contract)
    ruby_object.market_name = marketName().to_ruby if respond_to?(:marketName)
    ruby_object.min_tick = minTick().to_ruby if respond_to?(:minTick)
    ruby_object.price_magnifier = priceMagnifier().to_ruby if respond_to?(:priceMagnifier)
    ruby_object.order_types = orderTypes().to_ruby if respond_to?(:orderTypes)
    ruby_object.valid_exchanges = validExchanges().to_ruby if respond_to?(:validExchanges)
    ruby_object.under_conid = underConid().to_ruby if respond_to?(:underConid)
    ruby_object.long_name = longName().to_ruby if respond_to?(:longName)
    ruby_object.contract_month = contractMonth().to_ruby if respond_to?(:contractMonth)
    ruby_object.industry = industry().to_ruby if respond_to?(:industry)
    ruby_object.category = category().to_ruby if respond_to?(:category)
    ruby_object.subcategory = subcategory().to_ruby if respond_to?(:subcategory)
    ruby_object.time_zone_id = timeZoneId().to_ruby if respond_to?(:timeZoneId)
    ruby_object.trading_hours = tradingHours().to_ruby if respond_to?(:tradingHours)
    ruby_object.liquid_hours = liquidHours().to_ruby if respond_to?(:liquidHours)
    ruby_object.ev_rule = evRule().to_ruby if respond_to?(:evRule)
    ruby_object.ev_multiplier = evMultiplier().to_ruby if respond_to?(:evMultiplier)
    ruby_object.md_size_multiplier = mdSizeMultiplier().to_ruby if respond_to?(:mdSizeMultiplier)
    ruby_object.sec_id_list = secIdList().to_ruby if respond_to?(:secIdList)
    ruby_object.agg_group = aggGroup().to_ruby if respond_to?(:aggGroup)
    ruby_object.under_symbol = underSymbol().to_ruby if respond_to?(:underSymbol)
    ruby_object.under_sec_type = underSecType().to_ruby if respond_to?(:underSecType)
    ruby_object.market_rule_ids = marketRuleIds().to_ruby if respond_to?(:marketRuleIds)
    ruby_object.real_expiration_date = realExpirationDate().to_ruby if respond_to?(:realExpirationDate)
    ruby_object.last_trade_time = lastTradeTime().to_ruby if respond_to?(:lastTradeTime)
    ruby_object.cusip = cusip().to_ruby if respond_to?(:cusip)
    ruby_object.ratings = ratings().to_ruby if respond_to?(:ratings)
    ruby_object.desc_append = descAppend().to_ruby if respond_to?(:descAppend)
    ruby_object.bond_type = bondType().to_ruby if respond_to?(:bondType)
    ruby_object.coupon_type = couponType().to_ruby if respond_to?(:couponType)
    ruby_object.callable = callable().to_ruby if respond_to?(:callable)
    ruby_object.putable = putable().to_ruby if respond_to?(:putable)
    ruby_object.coupon = coupon().to_ruby if respond_to?(:coupon)
    ruby_object.convertible = convertible().to_ruby if respond_to?(:convertible)
    ruby_object.maturity = maturity().to_ruby if respond_to?(:maturity)
    ruby_object.issue_date = issueDate().to_ruby if respond_to?(:issueDate)
    ruby_object.next_option_date = nextOptionDate().to_ruby if respond_to?(:nextOptionDate)
    ruby_object.next_option_type = nextOptionType().to_ruby if respond_to?(:nextOptionType)
    ruby_object.next_option_partial = nextOptionPartial().to_ruby if respond_to?(:nextOptionPartial)
    ruby_object.notes = notes().to_ruby if respond_to?(:notes)

    ruby_object
  end
end
