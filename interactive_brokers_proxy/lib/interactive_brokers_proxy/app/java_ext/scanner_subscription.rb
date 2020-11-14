# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.ScannerSubscription"

class Java::ComIbClient::ScannerSubscription
  # Java api is inconsistent so we sadly must to check if we have the setter for each method
  def to_ruby
    ruby_object = InteractiveBrokersCommon::ScannerSubscription.new
    ruby_object.number_of_rows = numberOfRows().to_ruby if respond_to?(:numberOfRows)
    ruby_object.instrument = instrument().to_ruby if respond_to?(:instrument)
    ruby_object.location_code = locationCode().to_ruby if respond_to?(:locationCode)
    ruby_object.scan_code = scanCode().to_ruby if respond_to?(:scanCode)
    ruby_object.above_price = abovePrice().to_ruby if respond_to?(:abovePrice)
    ruby_object.below_price = belowPrice().to_ruby if respond_to?(:belowPrice)
    ruby_object.above_volume = aboveVolume().to_ruby if respond_to?(:aboveVolume)
    if respond_to?(:averageOptionVolumeAbove)
      ruby_object.average_option_volume_above = averageOptionVolumeAbove().to_ruby
    end
    ruby_object.market_cap_above = marketCapAbove().to_ruby if respond_to?(:marketCapAbove)
    ruby_object.market_cap_below = marketCapBelow().to_ruby if respond_to?(:marketCapBelow)
    ruby_object.moody_rating_above = moodyRatingAbove().to_ruby if respond_to?(:moodyRatingAbove)
    ruby_object.moody_rating_below = moodyRatingBelow().to_ruby if respond_to?(:moodyRatingBelow)
    ruby_object.sp_rating_above = spRatingAbove().to_ruby if respond_to?(:spRatingAbove)
    ruby_object.sp_rating_below = spRatingBelow().to_ruby if respond_to?(:spRatingBelow)
    ruby_object.maturity_date_above = maturityDateAbove().to_ruby if respond_to?(:maturityDateAbove)
    ruby_object.maturity_date_below = maturityDateBelow().to_ruby if respond_to?(:maturityDateBelow)
    ruby_object.coupon_rate_above = couponRateAbove().to_ruby if respond_to?(:couponRateAbove)
    ruby_object.coupon_rate_below = couponRateBelow().to_ruby if respond_to?(:couponRateBelow)
    ruby_object.exclude_convertible = excludeConvertible().to_ruby if respond_to?(:excludeConvertible)
    ruby_object.scanner_setting_pairs = scannerSettingPairs().to_ruby if respond_to?(:scannerSettingPairs)
    ruby_object.stock_type_filter = stockTypeFilter().to_ruby if respond_to?(:stockTypeFilter)

    ruby_object
  end
end
