# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-ethauth/version'

Gem::Specification.new do |gem|
  gem.name          = 'omniauth-ethauth'
  gem.version       = Omniauth::Ethauth::VERSION
  gem.authors       = ['Pei-Chen Tsou']
  gem.email         = ['pei@pelith.com']
  gem.description   = 'This is the strategy for authenticating to your Ethauth service'
  gem.summary       = 'This is the strategy for authenticating to your Ethauth service'
  gem.homepage      = 'https://github.com/linchus/omniauth-ethauth'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
  gem.add_development_dependency 'rspec', '~> 3.1'
  gem.add_development_dependency 'rspec-its', '~> 1.0'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'rake', '>= 12.0'
end