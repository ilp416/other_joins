# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'other_joins/version'

Gem::Specification.new do |spec|
  spec.name          = "other_joins"
  spec.version       = OtherJoins::VERSION
  spec.authors       = ["Levanevski-Perevozchikov Ilya"]
  spec.email         = ["ilp416@gmail.com"]

  spec.summary       = %q{Some joins methods for ActiveRecord}
  spec.description   = %q{Add obvious `left_joins`, `outer_joins` methods to ActiveRecord as plain way to outer joins tables.}
  spec.homepage      = 'https://github.com/ilp416/other_joins'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'activerecord', '>= 3.0', '< 5'

  spec.add_development_dependency 'appraisal'
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 11.1'
  spec.add_development_dependency 'sqlite3', '~> 1.3'
end
