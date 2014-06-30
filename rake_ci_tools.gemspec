# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rake_ci_tools/version'

Gem::Specification.new do |spec|
  spec.name          = "rake_ci_tools"
  spec.version       = '0.0.1'
  spec.authors       = ["chris griffiths"]
  spec.email         = ["christopher_griffiths@hotmail.com"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = "https://github.com/ChrisGriffiths/rake_ci_tools"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rake"
  spec.add_dependency "cucumber"
  spec.add_dependency "calabash-cucumber"
  spec.add_dependency "shenzhen"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "terminal-notifier-guard"
  spec.add_development_dependency "rspec-mocks"
end
