# frozen_string_literal: true

version = File.read(File.expand_path("../VERSION", __dir__)).strip

Gem::Specification.new do |spec|
  spec.name          = "interactive_brokers_generator"
  spec.version       = version
  spec.authors       = ["kvokka"]
  spec.email         = ["kvokka@yahoo.com"]

  spec.summary       = "Interactive Brokers API access trough HTTP. Java & Ruby code generator"
  spec.description   = "Generator of Java <=> Ruby bridge code for private & shared parts"
  spec.homepage      = "https://github.com/kvokka/interactive_brokers"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.0")
  spec.platform = Gem::Platform::RUBY

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/kvokka/interactive_brokers/blob/master/interactive_brokers_generator"
  spec.metadata["changelog_uri"] = "https://github.com/kvokka/interactive_brokers/blob/master/interactive_brokers_generator/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }

  spec.add_dependency "activesupport", ">= 6.0.0", "< 7.0"
  spec.add_dependency "interactive_brokers_common", version
end
