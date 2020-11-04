# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokersCommon
  ScannerSubscription = Struct.new(:number_of_rows, :instrument, :location_code, :scan_code, :above_price, :below_price, :above_volume, :average_option_volume_above, :market_cap_above, :market_cap_below, :moody_rating_above, :moody_rating_below, :sp_rating_above, :sp_rating_below, :maturity_date_above, :maturity_date_below, :coupon_rate_above, :coupon_rate_below, :exclude_convertible, :scanner_setting_pairs, :stock_type_filter, keyword_init: true) do
    def to_ib
      ib_object = Java::ComIbClient::ScannerSubscription.new
      ib_object.numberOfRows(number_of_rows).to_java unless number_of_rows.nil?
      ib_object.instrument(instrument).to_java unless instrument.nil?
      ib_object.locationCode(location_code).to_java unless location_code.nil?
      ib_object.scanCode(scan_code).to_java unless scan_code.nil?
      ib_object.abovePrice(above_price).to_java unless above_price.nil?
      ib_object.belowPrice(below_price).to_java unless below_price.nil?
      ib_object.aboveVolume(above_volume).to_java unless above_volume.nil?
      ib_object.averageOptionVolumeAbove(average_option_volume_above).to_java unless average_option_volume_above.nil?
      ib_object.marketCapAbove(market_cap_above).to_java unless market_cap_above.nil?
      ib_object.marketCapBelow(market_cap_below).to_java unless market_cap_below.nil?
      ib_object.moodyRatingAbove(moody_rating_above).to_java unless moody_rating_above.nil?
      ib_object.moodyRatingBelow(moody_rating_below).to_java unless moody_rating_below.nil?
      ib_object.spRatingAbove(sp_rating_above).to_java unless sp_rating_above.nil?
      ib_object.spRatingBelow(sp_rating_below).to_java unless sp_rating_below.nil?
      ib_object.maturityDateAbove(maturity_date_above).to_java unless maturity_date_above.nil?
      ib_object.maturityDateBelow(maturity_date_below).to_java unless maturity_date_below.nil?
      ib_object.couponRateAbove(coupon_rate_above).to_java unless coupon_rate_above.nil?
      ib_object.couponRateBelow(coupon_rate_below).to_java unless coupon_rate_below.nil?
      ib_object.excludeConvertible(exclude_convertible).to_java unless exclude_convertible.nil?
      ib_object.scannerSettingPairs(scanner_setting_pairs).to_java unless scanner_setting_pairs.nil?
      ib_object.stockTypeFilter(stock_type_filter).to_java unless stock_type_filter.nil?

      ib_object
    end
  end
end
