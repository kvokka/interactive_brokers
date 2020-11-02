[![CircleCI](https://circleci.com/gh/kvokka/interactive_brokers.svg?style=svg&circle-token=851335638907651b4fbdf0d5dabff056600067c0)](https://circleci.com/gh/kvokka/interactive_brokers)

# InteractiveBrokers

This allow to communicate with Interactive Brokers (further IB) trough HTTP.
This gem contains 3 parts:

* Server application (proxy) will communicate with IB and serve clients requests.
* Code generators
* Client part extensions, which should help to generate correct request on the client 
side with out any knowledge of server side internals

Request life cycle looks like:

client => server application => IB Gateway (async wait) => responce to the client

All long-processing requests have some Id field (requestId, orderId or something like it, will 
name it just ID later on). Presence of the ide will determine the request type.
1. Requests where ID is mot mandatory are treated as fast (or the server side responce 
does not matter), so they are **not** concurrent by the design of IB Gateway
2. Requests with ID will gather all the responses in the context of this ID.

It is the client's responsibility to provide uniq ID. Unfortunately, embedded IB function
`NextValidId` will not support concurrency correctly with external API calls.

## Current progress

*NOTE*: All functions naming is from Java official API doc. URI paths for corresponding
functions will be the same.

### Global functions

* [ ] reqOpenOrders
* [ ] reqAccountUpdates
* [ ] reqIds
* [ ] reqNewsBulletins
* [ ] cancelNewsBulletins
* [ ] setServerLogLevel
* [ ] reqAutoOpenOrders
* [ ] reqAllOpenOrders
* [ ] reqManagedAccts
* [ ] reqScannerParameters
* [ ] reqCurrentTime
* [ ] reqMarketDataType
* [ ] reqGlobalCancel
* [ ] reqPositions
* [ ] cancelPositions
* [ ] reqFamilyCodes
* [ ] reqMktDepthExchanges
* [ ] reqNewsProviders
* [ ] reqMarketRule
* [ ] reqCompletedOrders

### Functions with ID

* [ ] reqMktData
* [ ] cancelMktData
* [ ] placeOrder
* [ ] cancelOrder
* [ ] reqExecutions
* [ ] reqContractDetails
* [ ] reqMktDepth
* [ ] cancelMktDepth
* [ ] reqHistoricalData
* [ ] exerciseOptions
* [ ] cancelHistoricalData
* [ ] reqRealTimeBars
* [ ] cancelRealTimeBars
* [ ] cancelScannerSubscription
* [ ] reqScannerSubscription
* [ ] reqFundamentalData
* [ ] cancelFundamentalData
* [ ] calculateImpliedVolatility
* [ ] calculateOptionPrice
* [ ] cancelCalculateImpliedVolatility
* [ ] cancelCalculateOptionPrice
* [ ] reqAccountSummary
* [ ] cancelAccountSummary
* [ ] queryDisplayGroups
* [ ] subscribeToGroupEvents
* [ ] updateDisplayGroup
* [ ] unsubscribeFromGroupEvents
* [ ] reqPositionsMulti
* [ ] cancelPositionsMulti
* [ ] reqAccountUpdatesMulti
* [ ] cancelAccountUpdatesMulti
* [ ] reqSecDefOptParams
* [ ] reqSoftDollarTiers
* [ ] reqMatchingSymbols
* [ ] reqSmartComponents
* [ ] reqNewsArticle
* [ ] reqHistoricalNews
* [ ] reqHeadTimestamp
* [ ] cancelHeadTimestamp
* [ ] reqHistogramData
* [ ] cancelHistogramData
* [ ] reqPnL
* [ ] cancelPnL
* [ ] reqPnLSingle
* [ ] cancelPnLSingle
* [ ] reqHistoricalTicks
* [ ] reqTickByTickData
* [ ] cancelTickByTickData


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'interactive_brokers'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install interactive_brokers

## Usage

### Server application

#### ENV variables

* PORT = 3333 , default puma port
* RACK_ENV = development
* MAX_THREAD_COUNT = 5
* ROOT_PATH, project root
* APP_PATH, sinatra application root

### Code generators (IB API Upgrade)

Required for IB API upgrade. For the upgrade you should:

0. `bundle install`
1. Replace `vendor/TwsApi.jar` with the required version
2. Re-generate classes with `exe/generate_ruby_classes`
3. Run specs
4. Update documentation

### Client extensions

Includes the Ruby mirror of JRuby classes, which allows to easy create request parameters.
All methods & parameters names mirror [official API doc](https://interactivebrokers.github.io/tws-api/index.html).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/interactive_brokers. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/interactive_brokers/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the InteractiveBrokers project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/interactive_brokers/blob/master/CODE_OF_CONDUCT.md).
