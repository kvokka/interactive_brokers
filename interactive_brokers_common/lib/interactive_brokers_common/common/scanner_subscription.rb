# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokersCommon
  ScannerSubscription = Struct.new(:number_of_rows, :instrument, :location_code, :scan_code, :above_price, :below_price, :above_volume, :average_option_volume_above, :market_cap_above, :market_cap_below, :moody_rating_above, :moody_rating_below, :sp_rating_above, :sp_rating_below, :maturity_date_above, :maturity_date_below, :coupon_rate_above, :coupon_rate_below, :exclude_convertible, :scanner_setting_pairs, :stock_type_filter, keyword_init: true) do
    def to_ib
      ib_object = Java::ComIbClient::ScannerSubscription.new
      ib_object.numberOfRows(Integer(number_of_rows)).to_java unless number_of_rows.nil?
      ib_object.instrument(String(instrument)).to_java unless instrument.nil?
      ib_object.locationCode(String(location_code)).to_java unless location_code.nil?
      ib_object.scanCode(String(scan_code)).to_java unless scan_code.nil?
      ib_object.abovePrice(Float(above_price)).to_java unless above_price.nil?
      ib_object.belowPrice(Float(below_price)).to_java unless below_price.nil?
      ib_object.aboveVolume(Integer(above_volume)).to_java unless above_volume.nil?
      unless average_option_volume_above.nil?
        ib_object.averageOptionVolumeAbove(Integer(average_option_volume_above)).to_java
      end
      ib_object.marketCapAbove(Float(market_cap_above)).to_java unless market_cap_above.nil?
      ib_object.marketCapBelow(Float(market_cap_below)).to_java unless market_cap_below.nil?
      ib_object.moodyRatingAbove(String(moody_rating_above)).to_java unless moody_rating_above.nil?
      ib_object.moodyRatingBelow(String(moody_rating_below)).to_java unless moody_rating_below.nil?
      ib_object.spRatingAbove(String(sp_rating_above)).to_java unless sp_rating_above.nil?
      ib_object.spRatingBelow(String(sp_rating_below)).to_java unless sp_rating_below.nil?
      ib_object.maturityDateAbove(String(maturity_date_above)).to_java unless maturity_date_above.nil?
      ib_object.maturityDateBelow(String(maturity_date_below)).to_java unless maturity_date_below.nil?
      ib_object.couponRateAbove(Float(coupon_rate_above)).to_java unless coupon_rate_above.nil?
      ib_object.couponRateBelow(Float(coupon_rate_below)).to_java unless coupon_rate_below.nil?
      ib_object.excludeConvertible(!!exclude_convertible).to_java unless exclude_convertible.nil?
      ib_object.scannerSettingPairs(String(scanner_setting_pairs)).to_java unless scanner_setting_pairs.nil?
      ib_object.stockTypeFilter(String(stock_type_filter)).to_java unless stock_type_filter.nil?

      ib_object
    end

    def check_value_types!
      Integer(number_of_rows) unless number_of_rows.nil?
      String(instrument) unless instrument.nil?
      String(location_code) unless location_code.nil?
      String(scan_code) unless scan_code.nil?
      Float(above_price) unless above_price.nil?
      Float(below_price) unless below_price.nil?
      Integer(above_volume) unless above_volume.nil?
      Integer(average_option_volume_above) unless average_option_volume_above.nil?
      Float(market_cap_above) unless market_cap_above.nil?
      Float(market_cap_below) unless market_cap_below.nil?
      String(moody_rating_above) unless moody_rating_above.nil?
      String(moody_rating_below) unless moody_rating_below.nil?
      String(sp_rating_above) unless sp_rating_above.nil?
      String(sp_rating_below) unless sp_rating_below.nil?
      String(maturity_date_above) unless maturity_date_above.nil?
      String(maturity_date_below) unless maturity_date_below.nil?
      Float(coupon_rate_above) unless coupon_rate_above.nil?
      Float(coupon_rate_below) unless coupon_rate_below.nil?
      !!exclude_convertible unless exclude_convertible.nil?
      String(scanner_setting_pairs) unless scanner_setting_pairs.nil?
      String(stock_type_filter) unless stock_type_filter.nil?

      true
    end
  end
end
