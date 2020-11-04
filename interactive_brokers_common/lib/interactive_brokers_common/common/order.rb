# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokersCommon
  Order = Struct.new(:client_id, :order_id, :perm_id, :parent_id, :action, :total_quantity, :display_size, :order_type, :lmt_price, :aux_price, :tif, :account, :settling_firm, :clearing_account, :clearing_intent, :all_or_none, :block_order, :hidden, :outside_rth, :sweep_to_fill, :percent_offset, :trailing_percent, :trail_stop_price, :min_qty, :good_after_time, :good_till_date, :oca_group, :order_ref, :rule80_a, :oca_type, :trigger_method, :active_start_time, :active_stop_time, :fa_group, :fa_method, :fa_percentage, :fa_profile, :volatility, :volatility_type, :continuous_update, :reference_price_type, :delta_neutral_order_type, :delta_neutral_aux_price, :delta_neutral_con_id, :delta_neutral_open_close, :delta_neutral_short_sale, :delta_neutral_short_sale_slot, :delta_neutral_designated_location, :scale_init_level_size, :scale_subs_level_size, :scale_price_increment, :scale_price_adjust_value, :scale_price_adjust_interval, :scale_profit_offset, :scale_auto_reset, :scale_init_position, :scale_init_fill_qty, :scale_random_percent, :scale_table, :hedge_type, :hedge_param, :algo_strategy, :algo_params, :algo_id, :smart_combo_routing_params, :order_combo_legs, :what_if, :transmit, :override_percentage_constraints, :open_close, :origin, :short_sale_slot, :designated_location, :exempt_code, :delta_neutral_settling_firm, :delta_neutral_clearing_account, :delta_neutral_clearing_intent, :discretionary_amt, :e_trade_only, :firm_quote_only, :nbbo_price_cap, :opt_out_smart_routing, :auction_strategy, :starting_price, :stock_ref_price, :delta, :stock_range_lower, :stock_range_upper, :basis_points, :basis_points_type, :not_held, :order_misc_options, :solicited, :randomize_size, :randomize_price, :reference_contract_id, :pegged_change_amount, :is_pegged_change_amount_decrease, :reference_change_amount, :reference_exchange_id, :adjusted_order_type, :trigger_price, :adjusted_stop_price, :adjusted_stop_limit_price, :adjusted_trailing_amount, :adjustable_trailing_unit, :lmt_price_offset, :conditions, :conditions_cancel_order, :conditions_ignore_rth, :model_code, :ext_operator, :soft_dollar_tier, :cash_qty, :mifid2_decision_maker, :mifid2_decision_algo, :mifid2_execution_trader, :mifid2_execution_algo, :dont_use_auto_price_for_hedge, :is_oms_container, :discretionary_up_to_limit_price, :auto_cancel_date, :filled_quantity, :ref_futures_con_id, :auto_cancel_parent, :shareholder, :imbalance_only, :route_marketable_to_bbo, :parent_perm_id, :use_price_mgmt_algo, keyword_init: true) do
    def to_ib
      ib_object = Java::ComIbClient::Order.new
      ib_object.clientId(client_id).to_java unless client_id.nil?
      ib_object.orderId(order_id).to_java unless order_id.nil?
      ib_object.permId(perm_id).to_java unless perm_id.nil?
      ib_object.parentId(parent_id).to_java unless parent_id.nil?
      ib_object.action(action).to_java unless action.nil?
      ib_object.totalQuantity(total_quantity).to_java unless total_quantity.nil?
      ib_object.displaySize(display_size).to_java unless display_size.nil?
      ib_object.orderType(order_type).to_java unless order_type.nil?
      ib_object.lmtPrice(lmt_price).to_java unless lmt_price.nil?
      ib_object.auxPrice(aux_price).to_java unless aux_price.nil?
      ib_object.tif(tif).to_java unless tif.nil?
      ib_object.account(account).to_java unless account.nil?
      ib_object.settlingFirm(settling_firm).to_java unless settling_firm.nil?
      ib_object.clearingAccount(clearing_account).to_java unless clearing_account.nil?
      ib_object.clearingIntent(clearing_intent).to_java unless clearing_intent.nil?
      ib_object.allOrNone(all_or_none).to_java unless all_or_none.nil?
      ib_object.blockOrder(block_order).to_java unless block_order.nil?
      ib_object.hidden(hidden).to_java unless hidden.nil?
      ib_object.outsideRth(outside_rth).to_java unless outside_rth.nil?
      ib_object.sweepToFill(sweep_to_fill).to_java unless sweep_to_fill.nil?
      ib_object.percentOffset(percent_offset).to_java unless percent_offset.nil?
      ib_object.trailingPercent(trailing_percent).to_java unless trailing_percent.nil?
      ib_object.trailStopPrice(trail_stop_price).to_java unless trail_stop_price.nil?
      ib_object.minQty(min_qty).to_java unless min_qty.nil?
      ib_object.goodAfterTime(good_after_time).to_java unless good_after_time.nil?
      ib_object.goodTillDate(good_till_date).to_java unless good_till_date.nil?
      ib_object.ocaGroup(oca_group).to_java unless oca_group.nil?
      ib_object.orderRef(order_ref).to_java unless order_ref.nil?
      ib_object.rule80A(rule80_a).to_java unless rule80_a.nil?
      ib_object.ocaType(oca_type).to_java unless oca_type.nil?
      ib_object.triggerMethod(trigger_method).to_java unless trigger_method.nil?
      ib_object.activeStartTime(active_start_time).to_java unless active_start_time.nil?
      ib_object.activeStopTime(active_stop_time).to_java unless active_stop_time.nil?
      ib_object.faGroup(fa_group).to_java unless fa_group.nil?
      ib_object.faMethod(fa_method).to_java unless fa_method.nil?
      ib_object.faPercentage(fa_percentage).to_java unless fa_percentage.nil?
      ib_object.faProfile(fa_profile).to_java unless fa_profile.nil?
      ib_object.volatility(volatility).to_java unless volatility.nil?
      ib_object.volatilityType(volatility_type).to_java unless volatility_type.nil?
      ib_object.continuousUpdate(continuous_update).to_java unless continuous_update.nil?
      ib_object.referencePriceType(reference_price_type).to_java unless reference_price_type.nil?
      ib_object.deltaNeutralOrderType(delta_neutral_order_type).to_java unless delta_neutral_order_type.nil?
      ib_object.deltaNeutralAuxPrice(delta_neutral_aux_price).to_java unless delta_neutral_aux_price.nil?
      ib_object.deltaNeutralConId(delta_neutral_con_id).to_java unless delta_neutral_con_id.nil?
      ib_object.deltaNeutralOpenClose(delta_neutral_open_close).to_java unless delta_neutral_open_close.nil?
      ib_object.deltaNeutralShortSale(delta_neutral_short_sale).to_java unless delta_neutral_short_sale.nil?
      unless delta_neutral_short_sale_slot.nil?
        ib_object.deltaNeutralShortSaleSlot(delta_neutral_short_sale_slot).to_java
      end
      unless delta_neutral_designated_location.nil?
        ib_object.deltaNeutralDesignatedLocation(delta_neutral_designated_location).to_java
      end
      ib_object.scaleInitLevelSize(scale_init_level_size).to_java unless scale_init_level_size.nil?
      ib_object.scaleSubsLevelSize(scale_subs_level_size).to_java unless scale_subs_level_size.nil?
      ib_object.scalePriceIncrement(scale_price_increment).to_java unless scale_price_increment.nil?
      ib_object.scalePriceAdjustValue(scale_price_adjust_value).to_java unless scale_price_adjust_value.nil?
      ib_object.scalePriceAdjustInterval(scale_price_adjust_interval).to_java unless scale_price_adjust_interval.nil?
      ib_object.scaleProfitOffset(scale_profit_offset).to_java unless scale_profit_offset.nil?
      ib_object.scaleAutoReset(scale_auto_reset).to_java unless scale_auto_reset.nil?
      ib_object.scaleInitPosition(scale_init_position).to_java unless scale_init_position.nil?
      ib_object.scaleInitFillQty(scale_init_fill_qty).to_java unless scale_init_fill_qty.nil?
      ib_object.scaleRandomPercent(scale_random_percent).to_java unless scale_random_percent.nil?
      ib_object.scaleTable(scale_table).to_java unless scale_table.nil?
      ib_object.hedgeType(hedge_type).to_java unless hedge_type.nil?
      ib_object.hedgeParam(hedge_param).to_java unless hedge_param.nil?
      ib_object.algoStrategy(algo_strategy).to_java unless algo_strategy.nil?
      ib_object.algoParams(algo_params).to_java unless algo_params.nil?
      ib_object.algoId(algo_id).to_java unless algo_id.nil?
      ib_object.smartComboRoutingParams(smart_combo_routing_params).to_java unless smart_combo_routing_params.nil?
      ib_object.orderComboLegs(order_combo_legs).to_java unless order_combo_legs.nil?
      ib_object.whatIf(what_if).to_java unless what_if.nil?
      ib_object.transmit(transmit).to_java unless transmit.nil?
      unless override_percentage_constraints.nil?
        ib_object.overridePercentageConstraints(override_percentage_constraints).to_java
      end
      ib_object.openClose(open_close).to_java unless open_close.nil?
      ib_object.origin(origin).to_java unless origin.nil?
      ib_object.shortSaleSlot(short_sale_slot).to_java unless short_sale_slot.nil?
      ib_object.designatedLocation(designated_location).to_java unless designated_location.nil?
      ib_object.exemptCode(exempt_code).to_java unless exempt_code.nil?
      ib_object.deltaNeutralSettlingFirm(delta_neutral_settling_firm).to_java unless delta_neutral_settling_firm.nil?
      unless delta_neutral_clearing_account.nil?
        ib_object.deltaNeutralClearingAccount(delta_neutral_clearing_account).to_java
      end
      unless delta_neutral_clearing_intent.nil?
        ib_object.deltaNeutralClearingIntent(delta_neutral_clearing_intent).to_java
      end
      ib_object.discretionaryAmt(discretionary_amt).to_java unless discretionary_amt.nil?
      ib_object.eTradeOnly(e_trade_only).to_java unless e_trade_only.nil?
      ib_object.firmQuoteOnly(firm_quote_only).to_java unless firm_quote_only.nil?
      ib_object.nbboPriceCap(nbbo_price_cap).to_java unless nbbo_price_cap.nil?
      ib_object.optOutSmartRouting(opt_out_smart_routing).to_java unless opt_out_smart_routing.nil?
      ib_object.auctionStrategy(auction_strategy).to_java unless auction_strategy.nil?
      ib_object.startingPrice(starting_price).to_java unless starting_price.nil?
      ib_object.stockRefPrice(stock_ref_price).to_java unless stock_ref_price.nil?
      ib_object.delta(delta).to_java unless delta.nil?
      ib_object.stockRangeLower(stock_range_lower).to_java unless stock_range_lower.nil?
      ib_object.stockRangeUpper(stock_range_upper).to_java unless stock_range_upper.nil?
      ib_object.basisPoints(basis_points).to_java unless basis_points.nil?
      ib_object.basisPointsType(basis_points_type).to_java unless basis_points_type.nil?
      ib_object.notHeld(not_held).to_java unless not_held.nil?
      ib_object.orderMiscOptions(order_misc_options).to_java unless order_misc_options.nil?
      ib_object.solicited(solicited).to_java unless solicited.nil?
      ib_object.randomizeSize(randomize_size).to_java unless randomize_size.nil?
      ib_object.randomizePrice(randomize_price).to_java unless randomize_price.nil?
      ib_object.referenceContractId(reference_contract_id).to_java unless reference_contract_id.nil?
      ib_object.peggedChangeAmount(pegged_change_amount).to_java unless pegged_change_amount.nil?
      unless is_pegged_change_amount_decrease.nil?
        ib_object.isPeggedChangeAmountDecrease(is_pegged_change_amount_decrease).to_java
      end
      ib_object.referenceChangeAmount(reference_change_amount).to_java unless reference_change_amount.nil?
      ib_object.referenceExchangeId(reference_exchange_id).to_java unless reference_exchange_id.nil?
      ib_object.adjustedOrderType(adjusted_order_type).to_java unless adjusted_order_type.nil?
      ib_object.triggerPrice(trigger_price).to_java unless trigger_price.nil?
      ib_object.adjustedStopPrice(adjusted_stop_price).to_java unless adjusted_stop_price.nil?
      ib_object.adjustedStopLimitPrice(adjusted_stop_limit_price).to_java unless adjusted_stop_limit_price.nil?
      ib_object.adjustedTrailingAmount(adjusted_trailing_amount).to_java unless adjusted_trailing_amount.nil?
      ib_object.adjustableTrailingUnit(adjustable_trailing_unit).to_java unless adjustable_trailing_unit.nil?
      ib_object.lmtPriceOffset(lmt_price_offset).to_java unless lmt_price_offset.nil?
      ib_object.conditions(conditions).to_java unless conditions.nil?
      ib_object.conditionsCancelOrder(conditions_cancel_order).to_java unless conditions_cancel_order.nil?
      ib_object.conditionsIgnoreRth(conditions_ignore_rth).to_java unless conditions_ignore_rth.nil?
      ib_object.modelCode(model_code).to_java unless model_code.nil?
      ib_object.extOperator(ext_operator).to_java unless ext_operator.nil?
      ib_object.softDollarTier(soft_dollar_tier).to_java unless soft_dollar_tier.nil?
      ib_object.cashQty(cash_qty).to_java unless cash_qty.nil?
      ib_object.mifid2DecisionMaker(mifid2_decision_maker).to_java unless mifid2_decision_maker.nil?
      ib_object.mifid2DecisionAlgo(mifid2_decision_algo).to_java unless mifid2_decision_algo.nil?
      ib_object.mifid2ExecutionTrader(mifid2_execution_trader).to_java unless mifid2_execution_trader.nil?
      ib_object.mifid2ExecutionAlgo(mifid2_execution_algo).to_java unless mifid2_execution_algo.nil?
      unless dont_use_auto_price_for_hedge.nil?
        ib_object.dontUseAutoPriceForHedge(dont_use_auto_price_for_hedge).to_java
      end
      ib_object.isOmsContainer(is_oms_container).to_java unless is_oms_container.nil?
      unless discretionary_up_to_limit_price.nil?
        ib_object.discretionaryUpToLimitPrice(discretionary_up_to_limit_price).to_java
      end
      ib_object.autoCancelDate(auto_cancel_date).to_java unless auto_cancel_date.nil?
      ib_object.filledQuantity(filled_quantity).to_java unless filled_quantity.nil?
      ib_object.refFuturesConId(ref_futures_con_id).to_java unless ref_futures_con_id.nil?
      ib_object.autoCancelParent(auto_cancel_parent).to_java unless auto_cancel_parent.nil?
      ib_object.shareholder(shareholder).to_java unless shareholder.nil?
      ib_object.imbalanceOnly(imbalance_only).to_java unless imbalance_only.nil?
      ib_object.routeMarketableToBbo(route_marketable_to_bbo).to_java unless route_marketable_to_bbo.nil?
      ib_object.parentPermId(parent_perm_id).to_java unless parent_perm_id.nil?
      ib_object.usePriceMgmtAlgo(use_price_mgmt_algo).to_java unless use_price_mgmt_algo.nil?

      ib_object
    end
  end
end
