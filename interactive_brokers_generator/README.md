## Info

This is code generator for easier Interactive Brokers API upgrade. 
You do not need install this gem

## Usage

1. Update TWS API `vendor/TwsApi.jar` in the root of the `interactive_brokers` gem
2. Add/remove the classes, which should be in sync in `lib/config.yml`
3. Run
```bash
exe/ib_generator
```
4. Check the changes and update `proxy` accordingly.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the InteractiveBrokers project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/interactive_brokers/blob/master/CODE_OF_CONDUCT.md).
