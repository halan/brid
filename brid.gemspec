# -*- encoding: utf-8 -*-
require File.expand_path('../lib/brid/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Halan Pinheiro"]
  gem.email         = ["halan.pinheiro@gmail.com"]
  gem.description   = %q{Brazilian identifications like CPF, CNPJ, Titulo de Eleitor}
  gem.summary       = %q{Brazilian identifications like CPF, CNPJ, Titulo de Eleitor}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "brid"
  gem.require_paths = ["lib"]
  gem.version       = Brid::VERSION
end
