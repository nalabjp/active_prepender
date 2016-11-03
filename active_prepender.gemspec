# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_prepender/version'

Gem::Specification.new do |spec|
  spec.name          = 'active_prepender'
  spec.version       = ActivePrepender::VERSION
  spec.authors       = ['nalabjp']
  spec.email         = ['nalabjp@gmail.com']

  spec.summary       = %q{Enhancements for Module#prepend such as ActiveSupport::Concern}
  spec.homepage      = 'https://github.com/nalabjp/active_prepender'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'test-unit'
end
