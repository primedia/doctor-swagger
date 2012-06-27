# -*- encoding: utf-8 -*-
require File.expand_path('../lib/doctor-swagger/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Donald Plummer", "Michael Xavier"]
  gem.email         = ["developers@crystalcommerce.com"]
  gem.description   = %q{DSL for generating swagger resource documentation}
  gem.summary       = <<-EOS
Provides a mixin which gives a high-level DSL for describing a swagger
resource. Use this to generate a documentation endpoint to describe an API that
you wish to document with swagger.
  EOS
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "doctor-swagger"
  gem.require_paths = ["lib"]
  gem.version       = DoctorSwagger::VERSION
end
