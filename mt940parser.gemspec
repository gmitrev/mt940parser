# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mt940parser/version'

Gem::Specification.new do |spec|
  spec.name          = "mt940parser"
  spec.version       = MT940::VERSION
  spec.authors       = ["Georgi Mitrev"]
  spec.email         = ["gvmitrev@gmail.com"]
  spec.description   = %q{(SWIFT)MT940 file parser}
  spec.summary       = %q{Parser for the (SWIFT)-MT940 format}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "treetop"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
