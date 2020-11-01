# frozen_string_literal: true

require "bundler/setup"
require "interactive_brokers"
require "impersonator"
require_relative "../vendor/TwsApi.jar"

$LOAD_PATH << "../app"

Dir["#{__dir__}/../app/core_ext/**/*.rb"].sort.each { |file| require file }
Dir["#{__dir__}/../app/java_ext/**/*.rb"].sort.each { |file| require file }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.include_chain_clauses_in_custom_matcher_descriptions = true
    c.syntax = :expect
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  Dir["#{__dir__}/../spec/support/**/*.rb"].sort.each { |file| require file }
end
