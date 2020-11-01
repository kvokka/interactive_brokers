# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

java_import "com.ib.client.ScannerSubscription"

class Java::ComIbClient::ScannerSubscription
  def to_ruby
    ruby_object = InteractiveBrokers::Common::ScannerSubscription.new
    ruby_object.number_of_rows = numberOfRows().to_ruby
    ruby_object.instrument = instrument().to_ruby
    ruby_object.location_code = locationCode().to_ruby
    ruby_object.scan_code = scanCode().to_ruby
    ruby_object.above_price = abovePrice().to_ruby
    ruby_object.below_price = belowPrice().to_ruby
    ruby_object.above_volume = aboveVolume().to_ruby
    ruby_object.average_option_volume_above = averageOptionVolumeAbove().to_ruby
    ruby_object.market_cap_above = marketCapAbove().to_ruby
    ruby_object.market_cap_below = marketCapBelow().to_ruby
    ruby_object.moody_rating_above = moodyRatingAbove().to_ruby
    ruby_object.moody_rating_below = moodyRatingBelow().to_ruby
    ruby_object.sp_rating_above = spRatingAbove().to_ruby
    ruby_object.sp_rating_below = spRatingBelow().to_ruby
    ruby_object.maturity_date_above = maturityDateAbove().to_ruby
    ruby_object.maturity_date_below = maturityDateBelow().to_ruby
    ruby_object.coupon_rate_above = couponRateAbove().to_ruby
    ruby_object.coupon_rate_below = couponRateBelow().to_ruby
    ruby_object.exclude_convertible = excludeConvertible().to_ruby
    ruby_object.scanner_setting_pairs = scannerSettingPairs().to_ruby
    ruby_object.stock_type_filter = stockTypeFilter().to_ruby

    ruby_object
  end
end
