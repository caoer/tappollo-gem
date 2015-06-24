# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tappollo/version'

Gem::Specification.new do |spec|
  spec.name          = "tappollo"
  spec.version       = Tappollo::VERSION
  spec.authors       = ["Zitao Xiong"]
  spec.email         = ["caoer115@gmail.com"]
  spec.summary       = %q{A support kit for TMKit}
  spec.description   = %q{it might be useful}
  spec.homepage      = ""
  spec.license       = ""

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency('rdoc')
  spec.add_development_dependency('aruba')
  spec.add_dependency('tilt')
  spec.add_dependency('methadone', '~> 1.9.1')
end
