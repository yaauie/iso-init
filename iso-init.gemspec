# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iso-init/version'

Gem::Specification.new do |spec|
  spec.name          = 'iso-init'
  spec.version       = IsoInit::VERSION
  spec.authors       = ['Ryan Biesemeyer']
  spec.email         = ['ryan@yaauie.com']
  spec.description   = 'Attempts to isolate initialize arguments'
  spec.summary       = <<-EOSUMMARY
    Where possible, runs initialize with frozen duplicates of the
    original arguments.
  EOSUMMARY
  spec.homepage      = 'https://github.com/yaauie/iso-init'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
