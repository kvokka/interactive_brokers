# frozen_string_literal: true

version = File.read(File.expand_path("../VERSION", __dir__)).strip

Gem::Specification.new do |spec|
  spec.name          = "interactive_brokers_proxy"
  spec.version       = version
  spec.authors       = ["kvokka"]
  spec.email         = ["kvokka@yahoo.com"]

  spec.summary       = "Interactive Brokers API access trough HTTP. Adapter app"
  spec.description   = "Adapter, which allow to communicate with Interactive Brokers trough HTTP"
  spec.homepage      = "https://github.com/kvokka/interactive_brokers"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/kvokka/interactive_brokers/blob/master/interactive_brokers_proxy"
  spec.metadata["changelog_uri"] = "https://github.com/kvokka/interactive_brokers/blob/master/interactive_brokers_proxy/CHANGELOG.md"

  spec.require_paths = ["lib"]
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.add_dependency "activesupport", ">= 6.0.0", "< 7.0"
  spec.add_dependency "concurrent-ruby-edge", "~> 0.6.0"
  spec.add_dependency "interactive_brokers_common", version
  spec.add_dependency "puma", "~> 5.0.0"
  spec.add_dependency "rake", ">= 13.0"
  spec.add_dependency "sinatra", "~> 2.1.0"
  spec.add_dependency "sinatra-contrib", "~> 2.1.0"
  spec.add_dependency "sinatra-router", "~> 0.2.4"
end
