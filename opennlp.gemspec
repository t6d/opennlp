# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'opennlp/version'

Gem::Specification.new do |spec|
  spec.name          = "opennlp"
  spec.version       = Opennlp::VERSION
  spec.authors       = ["Konstantin Tennhard"]
  spec.email         = ["me@t6d.de"]
  spec.summary       = %q{A Ruby wrapper around Apache OpenNLP}
  spec.license       = "MIT"
  spec.platform      = "java"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
