# -*- encoding: utf-8 -*-
require File.expand_path('../lib/serverator/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Noah Paessel"]
  gem.email         = ["knowuh@gmail.com"]
  gem.description   = %q{ SSH wrapper for concord servers. }
  gem.summary       = %q{ Its hard to remember all those machine names!}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "serverator"
  gem.require_paths = ["lib"]
  gem.version       = Serverator::VERSION

  gem.add_development_dependency "rspec", "~> 2.6"
  gem.add_dependency "thor"
end
