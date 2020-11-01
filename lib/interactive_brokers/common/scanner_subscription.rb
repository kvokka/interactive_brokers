# frozen_string_literal: true

# ---------------------------------------------
# File generated automatically by interactive_brokers gem
# ---------------------------------------------

module InteractiveBrokers
  module Common
    ScannerSubscription = Struct.new(:number_of_rows, :instrument, :location_code, :scan_code, :above_price, :below_price, :above_volume, :average_option_volume_above, :market_cap_above, :market_cap_below, :moody_rating_above, :moody_rating_below, :sp_rating_above, :sp_rating_below, :maturity_date_above, :maturity_date_below, :coupon_rate_above, :coupon_rate_below, :exclude_convertible, :scanner_setting_pairs, :stock_type_filter, keyword_init: true) do
      def initialize(number_of_rows: nil, instrument: nil, location_code: nil, scan_code: nil, above_price: nil, below_price: nil, above_volume: nil, average_option_volume_above: nil, market_cap_above: nil, market_cap_below: nil, moody_rating_above: nil, moody_rating_below: nil, sp_rating_above: nil, sp_rating_below: nil, maturity_date_above: nil, maturity_date_below: nil, coupon_rate_above: nil, coupon_rate_below: nil, exclude_convertible: nil, scanner_setting_pairs: nil, stock_type_filter: nil)
        self.number_of_rows = number_of_rows
        self.instrument = instrument
        self.location_code = location_code
        self.scan_code = scan_code
        self.above_price = above_price
        self.below_price = below_price
        self.above_volume = above_volume
        self.average_option_volume_above = average_option_volume_above
        self.market_cap_above = market_cap_above
        self.market_cap_below = market_cap_below
        self.moody_rating_above = moody_rating_above
        self.moody_rating_below = moody_rating_below
        self.sp_rating_above = sp_rating_above
        self.sp_rating_below = sp_rating_below
        self.maturity_date_above = maturity_date_above
        self.maturity_date_below = maturity_date_below
        self.coupon_rate_above = coupon_rate_above
        self.coupon_rate_below = coupon_rate_below
        self.exclude_convertible = exclude_convertible
        self.scanner_setting_pairs = scanner_setting_pairs
        self.stock_type_filter = stock_type_filter
      end

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
end
