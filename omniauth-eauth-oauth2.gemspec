# frozen_string_literal: true

require File.expand_path(
  File.join('..', 'lib', 'omniauth', 'eauth_oauth2', 'version'),
  __FILE__
)

Gem::Specification.new do |gem|
  gem.authors       = ["Pei-Chen Tsou"]
  gem.email         = ["pei@pelith.com"]
  gem.description   = %q{Official OmniAuth strategy for Eauth.}
  gem.summary       = %q{Official OmniAuth strategy for Eauth.}
  gem.homepage      = "https://github.com/pelith/omniauth-eauth-oauth2"
  gem.license       = "MIT"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-eauth-oauth2"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::EauthOauth2::VERSION

  gem.add_dependency 'omniauth', '~> 1.5'
  gem.add_dependency 'omniauth-oauth2', '>= 1.4.0', '< 2.0'
  gem.add_development_dependency 'rspec', '~> 3.5'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end