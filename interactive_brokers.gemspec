# frozen_string_literal: true

require_relative 'lib/interactive_brokers/version'

Gem::Specification.new do |spec|
  spec.name          = 'interactive_brokers'
  spec.version       = InteractiveBrokers::VERSION
  spec.authors       = ['kvokka']
  spec.email         = ['kvokka@yahoo.com']

  spec.summary       = 'Interactive Brokers API access trough HTTP.'
  spec.description   = 'Simple way to interact with Interactive brokers via HTTP.'
  spec.homepage      = 'https://github.com/kvokka/interactive_brokers'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.7')

  spec.metadata['allowed_push_host'] = 'http://private_use_only.stub'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/kvokka/interactive_brokers'
  spec.metadata['changelog_uri'] = 'https://github.com/kvokka/interactive_brokers/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'activesupport', '>= 6.0.0', '< 7.0'
  spec.add_development_dependency 'amazing_print', '>= 1.2.0'
  spec.add_development_dependency 'bundler', '>= 1.17', '< 3.0'
  spec.add_development_dependency 'commander', '>= 4.5.0', '< 5.0'
  spec.add_development_dependency 'rake', '>= 13.0'
  spec.add_development_dependency 'rspec', '>= 3.10.0'
  spec.add_development_dependency 'rspec_junit_formatter'
end
