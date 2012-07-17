# -*- encoding: utf-8 -*-
require File.expand_path('../lib/brazilian_id/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Halan Pinheiro"]
  gem.email         = ["halan.pinheiro@gmail.com"]
  gem.description   = %q{Brazilian identifications like CPF, CNPJ, Título de Eleitor}
  gem.summary       = %q{Brazilian identifications like CPF, CNPJ, Título de Eleitor}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "brazilian_id"
  gem.require_paths = ["lib"]
  gem.version       = BrazilianId::VERSION
end
