# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "autotest-fsevent/version"

Gem::Specification.new do |s|
  s.name        = "autotest-fsevent"
  s.version     = Autotest::FSEvent::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Sven Schwyn"]
  s.email       = ["ruby@bitcetera.com"]
  s.homepage    = "http://www.bitcetera.com/products/autotest-fsevent"
  s.summary     = %q{Use FSEvent (on Mac OS X 10.5 or higher) instead of filesystem polling.}
  s.description = %q{Autotest relies on filesystem polling to detect modifications in source code files. This is expensive for the CPU, harddrive and battery - and unnecesary on Mac OS X 10.5 or higher which comes with the very efficient FSEvent core service for this very purpose. This gem teaches autotest how to use FSEvent.}

  s.rubyforge_project = "autotest-fsevent"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.post_install_message = "\e[1;32m\n" + ('-' * 79) + "\n\n" + File.read('PostInstall.txt') + "\n" + ('-' * 79) + "\n\e[0m"
  s.extensions = ["ext/fsevent/extconf.rb"]
  s.add_dependency "sys-uname"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "ZenTest"
end
