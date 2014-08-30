#encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lattes_api/version'

Gem::Specification.new do |spec|
  spec.name          = "lattes_api"
  spec.version       = LattesApi::VERSION
  spec.authors       = ["Rodrigo Manhães"]
  spec.email         = ["rmanhaes@gmail.com"]
  spec.summary       = %q{Lattes API client for Ruby.}
  spec.description   = %q{Lattes API client for Ruby.}
  spec.homepage      = "https://github.com/nsi-iff/lattes_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "savon"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "rubyzip"

end
