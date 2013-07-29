# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'whoopsy/version'

Gem::Specification.new do |gem|
  gem.name          = "whoopsy"
  gem.version       = Whoopsy::VERSION
  gem.authors       = ["Jon Gillies"]
  gem.email         = ["supercoder@gmail.com"]
  gem.description   = %q{Log to Whoops Logger in your scripts'}
  gem.summary       = %q{Awesome CLI Interface to Whoops Logger (http://www.whoopsapp.com/whoops-logger/)}
  gem.homepage      = "https://github.com/jongillies/whoopsy"
 
  gem.files = Dir['Rakefile', 'Gemfile', '{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*']
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = Dir['{test,spec,features}']

  gem.add_development_dependency "rspec"
  gem.add_runtime_dependency "trollop"

end
