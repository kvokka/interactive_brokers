## Info

Proxy application which allows to connect with TWS Gateway.

## Install

```
gem 'interactive_brokers_proxy'
```

## Usage

run server with `bendle exec rake server:start`

All the setting can be set with environment variables:

##### web server settings

* PORT = 3333 , default puma port
* RACK_ENV = development
* MAX_THREAD_COUNT = 5

##### application settings

* GATEWAY_HOST = localhost
* GATEWAY_PORT = 4002

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the InteractiveBrokers project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/interactive_brokers/blob/master/CODE_OF_CONDUCT.md).