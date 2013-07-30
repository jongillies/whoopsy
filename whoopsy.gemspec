# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'whoopsy/version'

Gem::Specification.new do |gem|
  gem.name          = 'whoopsy'
  gem.version       = Whoopsy::VERSION
  gem.authors       = Whoopsy::AUTHORS
  gem.email         = Whoopsy::EMAIL
  gem.description   = Whoopsy::DESCRIPTION
  gem.summary       = Whoopsy::SUMMARY
  gem.homepage      = Whoopsy::HOMEPAGE
 
  gem.files = Dir['Rakefile', 'Gemfile', '{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*']
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = Dir['{test,spec,features}']

  gem.add_development_dependency 'rspec'
  gem.add_runtime_dependency 'trollop'
  #gem.add_runtime_dependency 'active_support'

end
