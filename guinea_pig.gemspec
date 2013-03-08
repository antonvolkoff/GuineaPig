# -*- encoding: utf-8 -*-
require File.expand_path("../lib/guinea_pig/version", __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Fernando Guillen"]
  gem.email         = ["fguillen.mail@gmail.com"]
  gem.description   = "Very simple ABTest functionality for Ruby, based in ActiveRecord and with Rails 3 generators"
  gem.summary       = "Very simple ABTest functionality for Ruby, based in ActiveRecord and with Rails 3 generators"
  gem.homepage      = "https://github.com/fguillen/GuineaPig"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "guinea_pig"
  gem.require_paths = ["lib"]
  gem.version       = GuineaPig::VERSION

  gem.add_runtime_dependency "rails", "~> 3.0"
  gem.add_development_dependency "mocha"
  gem.add_development_dependency "sqlite3"
  gem.add_development_dependency "assert_difference"
end
