# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'one_brasil/version'

Gem::Specification.new do |gem|
  gem.name          = "one_brasil"
  gem.version       = OneBrasil::VERSION
  gem.authors       = ["Ramon Soares"]
  gem.email         = ["ramon@codecraft63.com"]
  gem.description   = %q{SMS Broadcast ONE BRASIL Ruby Wrapper}
  gem.summary       = %q{SMS Broadcast ONE BRASIL Ruby Wrapper}
  gem.homepage      = "http://github.com/codecraft63/one_brasil"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "rake",              "~> 0.9.2.2"
  gem.add_development_dependency "rspec", "~> 2.11"
end
