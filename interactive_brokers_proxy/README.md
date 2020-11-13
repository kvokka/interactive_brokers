## Info

Proxy application which allows to connect with TWS Gateway.

## Install

```
gem 'interactive_brokers_proxy'
```

## Usage

run server with `bendle exec rake server:start`

All the settings can be done with environment variables:

##### web server settings

* PORT = 3333 , default puma port
* RACK_ENV = development
* MAX_THREAD_COUNT = 5

##### application settings

By default it is assumed, that the gateway is running **paper** trading 
on default settings

* GATEWAY_HOST = localhost
* GATEWAY_PORT = 4002
* GATEWAY_CLIENT_ID = 2
* LOG_LEVEL = 'info'
* DEFAULT_TIMEOUT = 5

## Testing

* `bundle exec rake spec`
* `bundle exec rake features` # require running Gateway in **paper trading** mode

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the InteractiveBrokers project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/interactive_brokers/blob/master/CODE_OF_CONDUCT.md).
