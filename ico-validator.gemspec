# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'ico-validator'
  spec.version       = '0.2.0'
  spec.authors       = ['Premysl Donat']
  spec.email         = ['donat@uol.cz']
  spec.summary       = %q{Rails validator for validating format of czech identification number = IC}
  spec.description   = %q{Rails validator for validating format of czech identification number = IC}
  spec.homepage      = 'http://www.uol.cz'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency             'activemodel', '>= 4.1.0'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'codeclimate-test-reporter'
end
