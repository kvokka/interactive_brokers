# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.Order"

class Java::ComIbClient::Order
  # Java api is inconsistent so we sadly must to check if we have the setter for each method
  def to_ruby
    ruby_object = InteractiveBrokersCommon::Order.new
    ruby_object.client_id = clientId().to_ruby if respond_to?(:clientId)
    ruby_object.order_id = orderId().to_ruby if respond_to?(:orderId)
    ruby_object.perm_id = permId().to_ruby if respond_to?(:permId)
    ruby_object.parent_id = parentId().to_ruby if respond_to?(:parentId)
    ruby_object.action = action().to_ruby if respond_to?(:action)
    ruby_object.total_quantity = totalQuantity().to_ruby if respond_to?(:totalQuantity)
    ruby_object.display_size = displaySize().to_ruby if respond_to?(:displaySize)
    ruby_object.order_type = orderType().to_ruby if respond_to?(:orderType)
    ruby_object.lmt_price = lmtPrice().to_ruby if respond_to?(:lmtPrice)
    ruby_object.aux_price = auxPrice().to_ruby if respond_to?(:auxPrice)
    ruby_object.tif = tif().to_ruby if respond_to?(:tif)
    ruby_object.account = account().to_ruby if respond_to?(:account)
    ruby_object.settling_firm = settlingFirm().to_ruby if respond_to?(:settlingFirm)
    ruby_object.clearing_account = clearingAccount().to_ruby if respond_to?(:clearingAccount)
    ruby_object.clearing_intent = clearingIntent().to_ruby if respond_to?(:clearingIntent)
    ruby_object.all_or_none = allOrNone().to_ruby if respond_to?(:allOrNone)
    ruby_object.block_order = blockOrder().to_ruby if respond_to?(:blockOrder)
    ruby_object.hidden = hidden().to_ruby if respond_to?(:hidden)
    ruby_object.outside_rth = outsideRth().to_ruby if respond_to?(:outsideRth)
    ruby_object.sweep_to_fill = sweepToFill().to_ruby if respond_to?(:sweepToFill)
    ruby_object.percent_offset = percentOffset().to_ruby if respond_to?(:percentOffset)
    ruby_object.trailing_percent = trailingPercent().to_ruby if respond_to?(:trailingPercent)
    ruby_object.trail_stop_price = trailStopPrice().to_ruby if respond_to?(:trailStopPrice)
    ruby_object.min_qty = minQty().to_ruby if respond_to?(:minQty)
    ruby_object.good_after_time = goodAfterTime().to_ruby if respond_to?(:goodAfterTime)
    ruby_object.good_till_date = goodTillDate().to_ruby if respond_to?(:goodTillDate)
    ruby_object.oca_group = ocaGroup().to_ruby if respond_to?(:ocaGroup)
    ruby_object.order_ref = orderRef().to_ruby if respond_to?(:orderRef)
    ruby_object.rule80_a = rule80A().to_ruby if respond_to?(:rule80A)
    ruby_object.oca_type = ocaType().to_ruby if respond_to?(:ocaType)
    ruby_object.trigger_method = triggerMethod().to_ruby if respond_to?(:triggerMethod)
    ruby_object.active_start_time = activeStartTime().to_ruby if respond_to?(:activeStartTime)
    ruby_object.active_stop_time = activeStopTime().to_ruby if respond_to?(:activeStopTime)
    ruby_object.fa_group = faGroup().to_ruby if respond_to?(:faGroup)
    ruby_object.fa_method = faMethod().to_ruby if respond_to?(:faMethod)
    ruby_object.fa_percentage = faPercentage().to_ruby if respond_to?(:faPercentage)
    ruby_object.fa_profile = faProfile().to_ruby if respond_to?(:faProfile)
    ruby_object.volatility = volatility().to_ruby if respond_to?(:volatility)
    ruby_object.volatility_type = volatilityType().to_ruby if respond_to?(:volatilityType)
    ruby_object.continuous_update = continuousUpdate().to_ruby if respond_to?(:continuousUpdate)
    ruby_object.reference_price_type = referencePriceType().to_ruby if respond_to?(:referencePriceType)
    ruby_object.delta_neutral_order_type = deltaNeutralOrderType().to_ruby if respond_to?(:deltaNeutralOrderType)
    ruby_object.delta_neutral_aux_price = deltaNeutralAuxPrice().to_ruby if respond_to?(:deltaNeutralAuxPrice)
    ruby_object.delta_neutral_con_id = deltaNeutralConId().to_ruby if respond_to?(:deltaNeutralConId)
    ruby_object.delta_neutral_open_close = deltaNeutralOpenClose().to_ruby if respond_to?(:deltaNeutralOpenClose)
    ruby_object.delta_neutral_short_sale = deltaNeutralShortSale().to_ruby if respond_to?(:deltaNeutralShortSale)
    if respond_to?(:deltaNeutralShortSaleSlot)
      ruby_object.delta_neutral_short_sale_slot = deltaNeutralShortSaleSlot().to_ruby
    end
    if respond_to?(:deltaNeutralDesignatedLocation)
      ruby_object.delta_neutral_designated_location = deltaNeutralDesignatedLocation().to_ruby
    end
    ruby_object.scale_init_level_size = scaleInitLevelSize().to_ruby if respond_to?(:scaleInitLevelSize)
    ruby_object.scale_subs_level_size = scaleSubsLevelSize().to_ruby if respond_to?(:scaleSubsLevelSize)
    ruby_object.scale_price_increment = scalePriceIncrement().to_ruby if respond_to?(:scalePriceIncrement)
    ruby_object.scale_price_adjust_value = scalePriceAdjustValue().to_ruby if respond_to?(:scalePriceAdjustValue)
    if respond_to?(:scalePriceAdjustInterval)
      ruby_object.scale_price_adjust_interval = scalePriceAdjustInterval().to_ruby
    end
    ruby_object.scale_profit_offset = scaleProfitOffset().to_ruby if respond_to?(:scaleProfitOffset)
    ruby_object.scale_auto_reset = scaleAutoReset().to_ruby if respond_to?(:scaleAutoReset)
    ruby_object.scale_init_position = scaleInitPosition().to_ruby if respond_to?(:scaleInitPosition)
    ruby_object.scale_init_fill_qty = scaleInitFillQty().to_ruby if respond_to?(:scaleInitFillQty)
    ruby_object.scale_random_percent = scaleRandomPercent().to_ruby if respond_to?(:scaleRandomPercent)
    ruby_object.scale_table = scaleTable().to_ruby if respond_to?(:scaleTable)
    ruby_object.hedge_type = hedgeType().to_ruby if respond_to?(:hedgeType)
    ruby_object.hedge_param = hedgeParam().to_ruby if respond_to?(:hedgeParam)
    ruby_object.algo_strategy = algoStrategy().to_ruby if respond_to?(:algoStrategy)
    ruby_object.algo_params = algoParams().to_ruby if respond_to?(:algoParams)
    ruby_object.algo_id = algoId().to_ruby if respond_to?(:algoId)
    ruby_object.smart_combo_routing_params = smartComboRoutingParams().to_ruby if respond_to?(:smartComboRoutingParams)
    ruby_object.order_combo_legs = orderComboLegs().to_ruby if respond_to?(:orderComboLegs)
    ruby_object.what_if = whatIf().to_ruby if respond_to?(:whatIf)
    ruby_object.transmit = transmit().to_ruby if respond_to?(:transmit)
    if respond_to?(:overridePercentageConstraints)
      ruby_object.override_percentage_constraints = overridePercentageConstraints().to_ruby
    end
    ruby_object.open_close = openClose().to_ruby if respond_to?(:openClose)
    ruby_object.origin = origin().to_ruby if respond_to?(:origin)
    ruby_object.short_sale_slot = shortSaleSlot().to_ruby if respond_to?(:shortSaleSlot)
    ruby_object.designated_location = designatedLocation().to_ruby if respond_to?(:designatedLocation)
    ruby_object.exempt_code = exemptCode().to_ruby if respond_to?(:exemptCode)
    if respond_to?(:deltaNeutralSettlingFirm)
      ruby_object.delta_neutral_settling_firm = deltaNeutralSettlingFirm().to_ruby
    end
    if respond_to?(:deltaNeutralClearingAccount)
      ruby_object.delta_neutral_clearing_account = deltaNeutralClearingAccount().to_ruby
    end
    if respond_to?(:deltaNeutralClearingIntent)
      ruby_object.delta_neutral_clearing_intent = deltaNeutralClearingIntent().to_ruby
    end
    ruby_object.discretionary_amt = discretionaryAmt().to_ruby if respond_to?(:discretionaryAmt)
    ruby_object.e_trade_only = eTradeOnly().to_ruby if respond_to?(:eTradeOnly)
    ruby_object.firm_quote_only = firmQuoteOnly().to_ruby if respond_to?(:firmQuoteOnly)
    ruby_object.nbbo_price_cap = nbboPriceCap().to_ruby if respond_to?(:nbboPriceCap)
    ruby_object.opt_out_smart_routing = optOutSmartRouting().to_ruby if respond_to?(:optOutSmartRouting)
    ruby_object.auction_strategy = auctionStrategy().to_ruby if respond_to?(:auctionStrategy)
    ruby_object.starting_price = startingPrice().to_ruby if respond_to?(:startingPrice)
    ruby_object.stock_ref_price = stockRefPrice().to_ruby if respond_to?(:stockRefPrice)
    ruby_object.delta = delta().to_ruby if respond_to?(:delta)
    ruby_object.stock_range_lower = stockRangeLower().to_ruby if respond_to?(:stockRangeLower)
    ruby_object.stock_range_upper = stockRangeUpper().to_ruby if respond_to?(:stockRangeUpper)
    ruby_object.basis_points = basisPoints().to_ruby if respond_to?(:basisPoints)
    ruby_object.basis_points_type = basisPointsType().to_ruby if respond_to?(:basisPointsType)
    ruby_object.not_held = notHeld().to_ruby if respond_to?(:notHeld)
    ruby_object.order_misc_options = orderMiscOptions().to_ruby if respond_to?(:orderMiscOptions)
    ruby_object.solicited = solicited().to_ruby if respond_to?(:solicited)
    ruby_object.randomize_size = randomizeSize().to_ruby if respond_to?(:randomizeSize)
    ruby_object.randomize_price = randomizePrice().to_ruby if respond_to?(:randomizePrice)
    ruby_object.reference_contract_id = referenceContractId().to_ruby if respond_to?(:referenceContractId)
    ruby_object.pegged_change_amount = peggedChangeAmount().to_ruby if respond_to?(:peggedChangeAmount)
    if respond_to?(:isPeggedChangeAmountDecrease)
      ruby_object.is_pegged_change_amount_decrease = isPeggedChangeAmountDecrease().to_ruby
    end
    ruby_object.reference_change_amount = referenceChangeAmount().to_ruby if respond_to?(:referenceChangeAmount)
    ruby_object.reference_exchange_id = referenceExchangeId().to_ruby if respond_to?(:referenceExchangeId)
    ruby_object.adjusted_order_type = adjustedOrderType().to_ruby if respond_to?(:adjustedOrderType)
    ruby_object.trigger_price = triggerPrice().to_ruby if respond_to?(:triggerPrice)
    ruby_object.adjusted_stop_price = adjustedStopPrice().to_ruby if respond_to?(:adjustedStopPrice)
    ruby_object.adjusted_stop_limit_price = adjustedStopLimitPrice().to_ruby if respond_to?(:adjustedStopLimitPrice)
    ruby_object.adjusted_trailing_amount = adjustedTrailingAmount().to_ruby if respond_to?(:adjustedTrailingAmount)
    ruby_object.adjustable_trailing_unit = adjustableTrailingUnit().to_ruby if respond_to?(:adjustableTrailingUnit)
    ruby_object.lmt_price_offset = lmtPriceOffset().to_ruby if respond_to?(:lmtPriceOffset)
    ruby_object.conditions = conditions().to_ruby if respond_to?(:conditions)
    ruby_object.conditions_cancel_order = conditionsCancelOrder().to_ruby if respond_to?(:conditionsCancelOrder)
    ruby_object.conditions_ignore_rth = conditionsIgnoreRth().to_ruby if respond_to?(:conditionsIgnoreRth)
    ruby_object.model_code = modelCode().to_ruby if respond_to?(:modelCode)
    ruby_object.ext_operator = extOperator().to_ruby if respond_to?(:extOperator)
    ruby_object.soft_dollar_tier = softDollarTier().to_ruby if respond_to?(:softDollarTier)
    ruby_object.cash_qty = cashQty().to_ruby if respond_to?(:cashQty)
    ruby_object.mifid2_decision_maker = mifid2DecisionMaker().to_ruby if respond_to?(:mifid2DecisionMaker)
    ruby_object.mifid2_decision_algo = mifid2DecisionAlgo().to_ruby if respond_to?(:mifid2DecisionAlgo)
    ruby_object.mifid2_execution_trader = mifid2ExecutionTrader().to_ruby if respond_to?(:mifid2ExecutionTrader)
    ruby_object.mifid2_execution_algo = mifid2ExecutionAlgo().to_ruby if respond_to?(:mifid2ExecutionAlgo)
    if respond_to?(:dontUseAutoPriceForHedge)
      ruby_object.dont_use_auto_price_for_hedge = dontUseAutoPriceForHedge().to_ruby
    end
    ruby_object.is_oms_container = isOmsContainer().to_ruby if respond_to?(:isOmsContainer)
    if respond_to?(:discretionaryUpToLimitPrice)
      ruby_object.discretionary_up_to_limit_price = discretionaryUpToLimitPrice().to_ruby
    end
    ruby_object.auto_cancel_date = autoCancelDate().to_ruby if respond_to?(:autoCancelDate)
    ruby_object.filled_quantity = filledQuantity().to_ruby if respond_to?(:filledQuantity)
    ruby_object.ref_futures_con_id = refFuturesConId().to_ruby if respond_to?(:refFuturesConId)
    ruby_object.auto_cancel_parent = autoCancelParent().to_ruby if respond_to?(:autoCancelParent)
    ruby_object.shareholder = shareholder().to_ruby if respond_to?(:shareholder)
    ruby_object.imbalance_only = imbalanceOnly().to_ruby if respond_to?(:imbalanceOnly)
    ruby_object.route_marketable_to_bbo = routeMarketableToBbo().to_ruby if respond_to?(:routeMarketableToBbo)
    ruby_object.parent_perm_id = parentPermId().to_ruby if respond_to?(:parentPermId)
    ruby_object.use_price_mgmt_algo = usePriceMgmtAlgo().to_ruby if respond_to?(:usePriceMgmtAlgo)

    ruby_object
  end
end
