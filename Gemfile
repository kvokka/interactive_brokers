# frozen_string_literal: true

source "https://rubygems.org"
ruby "2.5.7", engine: "jruby", engine_version: "~> 9.2"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem "amazing_print", "~> 1.2.0"
gem "pry"
gem "rubocop", require: false
gem "rubocop-rspec", "~> 2.0.0", require: false

group :test do
  gem "cucumber", "~> 5.2.0"
  gem "rack-test", "~> 1.1.0"
  gem "rspec", ">= 3.10.0", "< 4.0"
  gem "rspec_junit_formatter"
  gem "typhoeus", "~> 1.4.0"
end

gemspec
