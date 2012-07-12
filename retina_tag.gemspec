# -*- encoding: utf-8 -*-
require File.expand_path('../lib/retina_tag/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["David Estes"]
  gem.email         = ["destes@redwindsw.com"]
  gem.description   = "This gem overrides image_tag to support retina resolution images using asset pipeline"
  gem.summary       = "image_tag addon for retina graphics, with cache support."
  gem.homepage      = "http://github.com/davydotcom/retina_tag"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "retina_tag"
  gem.require_paths = ["lib","vendor"]
  gem.version       = RetinaTag::VERSION

  gem.add_dependency 'jquery-rails'
  gem.add_dependency "railties", "~> 3.1"

end
