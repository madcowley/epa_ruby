# -*- encoding: utf-8 -*-
require File.expand_path('../lib/epa/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'EPA_envirofacts'
  gem.version     = EPA::VERSION
  gem.author      = "blakeshall"
  gem.email       = 'blake@codeforamerica.org'
  gem.homepage    = ''
  gem.summary     = %q{A Ruby wrapper for the EPA envirofacts api}
  gem.description = %q{Currently only supports PCS and RADSInfo databases}

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  gem.require_paths = ['lib']

  gem.add_development_dependency 'maruku'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'yard'
  gem.add_development_dependency 'webmock'

  gem.add_runtime_dependency 'faraday'
  gem.add_runtime_dependency 'faraday_middleware'
  gem.add_runtime_dependency 'hashie'
  gem.add_runtime_dependency 'multi_xml'
  gem.add_runtime_dependency 'rash'
  gem.add_runtime_dependency 'json', '~> 1.7.7'
end
