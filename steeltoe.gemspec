# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'steeltoe/version'

Gem::Specification.new do |spec|
  spec.name          = "steeltoe"
  spec.version       = Steeltoe::VERSION
  spec.authors       = ["Eric Steele"]
  spec.email         = ["eric@notvelcro.com"]
  spec.description   = "A flatter style bootstrap for simple projects"
  spec.summary       = "I wanted better looking default styles, so I put together a better bootstrap."
  spec.homepage      = "https://github.com/genericsteele/steeltoe"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
