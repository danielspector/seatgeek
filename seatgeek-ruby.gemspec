# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'seatgeek/version'

Gem::Specification.new do |spec|
  spec.name          = "seatgeek-ruby"
  spec.version       = SeatGeek::VERSION
  spec.authors       = ["Daniel Spector"]
  spec.email         = ["daniel.spector@lifebooker.com"]
  spec.summary       = %q{Summary}
  spec.description   = %q{Description}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_dependency "faraday"
  spec.add_dependency "hashie"
  spec.add_dependency "multi_json"
  spec.add_dependency "activesupport"

end
