# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "query_string/version"

Gem::Specification.new do |s|
  s.name        = "query_string"
  s.version     = QueryString::VERSION
  s.authors     = ["Simen Svale Skogsrud", "Alexander Popov"]
  s.email       = ["simen@bengler.no", "alex.wayfer@gmail.com"]
  s.homepage    = "https://github.com/AlexWayfer/query_string"
  s.summary     = %q{A straight forward gem to convert ruby hashes and arrays to http query strings.}
  s.description = %q{ It supports hashes, arrays, nested hashes and arrays of hashes and all combinations thereof.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
