# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mami/version'

Gem::Specification.new do |spec|
  spec.name          = "mami"
  spec.version       = Mami::VERSION
  spec.authors       = ["sanemat"]
  spec.email         = ["o.gata.ken@gmail.com"]
  spec.description   = %q{Command for date}
  spec.summary       = %q{Utility for date}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency 'thor'
end
