# frozen_string_literal: true

require_relative 'lib/query_string/version'

Gem::Specification.new do |s|
  s.name        = 'query_string'
  s.version     = QueryString::VERSION
  s.authors     = ['Simen Svale Skogsrud', 'Alexander Popov']
  s.email       = ['simen@bengler.no', 'alex.wayfer@gmail.com']
  s.homepage    = 'https://github.com/AlexWayfer/query_string'
  s.summary     = 'Build HTTP query strings from nested Ruby Hashes and Arrays.'
  s.description =
    'It supports Hashes, Arrays, nested Hashes and Arrays of Hashes ' \
    'and all combinations thereof.'

  s.license = 'MIT'

  s.required_ruby_version = '>= 2.3'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ['lib']

  # specify any dependencies here; for example:
  s.add_development_dependency 'codecov', '~> 0.1'
  s.add_development_dependency 'rake', '~> 13'
  s.add_development_dependency 'rspec', '~> 3.7'
  s.add_development_dependency 'rubocop', '~> 0.81.0'
  s.add_development_dependency 'simplecov', '~> 0.16'
  # s.add_runtime_dependency 'rest-client'
end
