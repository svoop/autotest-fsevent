# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'autotest-fsevent/version'

Gem::Specification.new do |spec|
  spec.name          = 'autotest-fsevent'
  spec.version       = Autotest::FSEvent::VERSION
  spec.authors       = ['Sven Schwyn']
  spec.email         = ['ruby@bitcetera.com']
  spec.description   = %q(Autotest relies on filesystem polling to detect modifications in source code files. This is expensive for the CPU, harddrive and battery - and unnecesary on Mac OS X 10.5 or higher which comes with the very efficient FSEvent core service for this very purpose. This gem teaches autotest how to use FSEvent.)
  spec.summary       = %q(Use FSEvent (on Mac OS X 10.5 or higher) instead of filesystem polling.)
  spec.homepage      = 'https://github.com/svoop/autotest-fsevent'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.post_install_message = "\e[1;32m\n" + ('-' * 79) + "\n\n" + File.read('post-install.txt').strip + "\n\n" + ('-' * 79) + "\n\e[0m"

  spec.extensions = ['ext/fsevent/extconf.rb']

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency "minitest-autotest"

  spec.add_runtime_dependency 'sys-uname'
end
