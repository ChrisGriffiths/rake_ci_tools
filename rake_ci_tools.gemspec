# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "rake_ci_tools"
  spec.version       = '0.0.4'
  spec.authors       = ["chris griffiths"]
  spec.email         = ["christopher_griffiths@hotmail.com"]
  spec.summary       = %q{Rake tasks for building, testing and deploying xcode projects}
  spec.description   = <<-EOF 
    Predined Rake tasks for building, testing and deploying xcode projects
    Includes Support for: - XCode: Build, Test
                          - Cucumber: calabash
                          - Vagrant: Run Cucumber Tests using Vagrant
  EOF

  spec.homepage      = "https://github.com/ChrisGriffiths/rake_ci_tools"
  spec.license       = "MIT"

  spec.files         = Dir.glob("lib/**/*.rb")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rake" , "~> 10.3"
  spec.add_dependency "cucumber" , "~> 1.3"
  spec.add_dependency "calabash-cucumber" , "~> 0.9.168"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "rspec-mocks", "~> 2.14"
  spec.add_development_dependency "guard-rspec", "~> 4.2"
  spec.add_development_dependency "terminal-notifier-guard", "~> 1.5"
end
