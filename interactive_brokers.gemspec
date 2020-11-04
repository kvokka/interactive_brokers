# frozen_string_literal: true

version = File.read(File.expand_path("VERSION", __dir__)).strip

Gem::Specification.new do |spec|
  spec.name          = "interactive_brokers"
  spec.version       = version
  spec.authors       = ["kvokka"]
  spec.email         = ["kvokka@yahoo.com"]

  spec.summary       = "Interactive Brokers API access trough HTTP."
  spec.description   = "Simple way to interact with Interactive brokers via HTTP."
  spec.homepage      = "https://github.com/kvokka/interactive_brokers"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.7")

  spec.metadata["allowed_push_host"] = "http://private_use_only.stub"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/kvokka/interactive_brokers"
  spec.metadata["changelog_uri"] = "https://github.com/kvokka/interactive_brokers/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler", ">= 1.17", "< 3.0"
  spec.add_dependency "interactive_brokers_common", version
  spec.add_dependency "interactive_brokers_generator", version
  spec.add_dependency "interactive_brokers_proxy", version
end
