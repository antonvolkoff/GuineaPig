# -*- encoding: utf-8 -*-
require File.expand_path("../lib/ab_test/version", __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Fernando Guillen"]
  gem.email         = ["fguillen.mail@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "ab_test"
  gem.require_paths = ["lib"]
  gem.version       = ABTest::VERSION

  gem.add_runtime_dependency "rails", "~> 3.0"
  gem.add_development_dependency "mocha"
  gem.add_development_dependency "sqlite3"
  gem.add_development_dependency "assert_difference"
end
