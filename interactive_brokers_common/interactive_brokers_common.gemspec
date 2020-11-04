# frozen_string_literal: true

version = File.read(File.expand_path("../VERSION", __dir__)).strip

Gem::Specification.new do |spec|
  spec.name          = "interactive_brokers_common"
  spec.version       = version
  spec.authors       = ["kvokka"]
  spec.email         = ["kvokka@yahoo.com"]

  spec.summary       = "Interactive Brokers API access trough HTTP. Common parts"
  spec.description   = "Simple way to interact with Interactive brokers via HTTP. Sharable parts"
  spec.homepage      = "https://github.com/kvokka/interactive_brokers"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/kvokka/interactive_brokers/blob/master/interactive_brokers_common"
  spec.metadata["changelog_uri"] = "https://github.com/kvokka/interactive_brokers/blob/master/interactive_brokers_common/CHANGELOG.md"

  spec.require_paths = ["lib"]
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
end
