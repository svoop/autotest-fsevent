require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/autotest-fsevent'

Hoe.plugin :newgem
# Hoe.plugin :website
# Hoe.plugin :cucumberfeatures

$hoe = Hoe.spec 'autotest-fsevent' do
  self.developer              'Sven Schwyn', 'ruby@bitcetera.com'
  self.summary              = %q{Use FSEvent (on Mac OS X 10.5 or higher) instead of filesystem polling.}
  self.description          = %q{ZenTest's autotest relies on filesystem polling to detect modifications in source code files. This is expensive for the CPU, harddrive and battery - and unnecesary on Mac OS X 10.5 or higher which comes with the very efficient FSEvent core service for this purpose. This gem teaches autotest how to use FSEvent.}
  self.url                  = %q{http://www.bitcetera.com/products/autotest-fsevent}
  self.post_install_message = "\n\e[1;32m" + File.read('PostInstall.txt') + "\e[0m\n"
  self.rubyforge_name       = self.name
  self.extra_deps           = [
                                ['ZenTest','>= 4.1.3'],
                                ['sys-uname', '>= 0.8.3'],
                              ]
end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }

task :default => [:spec]
