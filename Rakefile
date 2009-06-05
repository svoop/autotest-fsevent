require 'rubygems' unless ENV['NO_RUBYGEMS']
%w[rake rake/clean fileutils newgem rubigen].each { |f| require f }
require File.dirname(__FILE__) + '/lib/autotest-fsevent'

$hoe = Hoe.new('autotest-fsevent', AutotestFSEvent::VERSION) do |p|
  p.developer('Sven Schwyn', 'ruby@bitcetera.com')
  p.summary              = %q{Use FSEvent (on Mac OS X 10.5 or higher) instead of filesystem polling.}
  p.description          = %q{ZenTest's autotest relies on filesystem polling to detect modifications in source code files. This is expensive for the CPU, harddrive and battery - and unnecesary on Mac OS X 10.5 or higher which comes with the very efficient FSEvent core service for this purpose. This gem teaches autotest how to use FSEvent.}
  p.url                  = %q{http://www.bitcetera.com/products/autotest-fsevent}
  p.changes              = p.paragraphs_of("History.txt", 0..1).join("\n\n")
  p.post_install_message = "\n\e[1;32m" + File.read('PostInstall.txt') + "\e[0;30m\n"
  p.rubyforge_name       = p.name
  p.extra_deps         = [
    ['ZenTest','>= 4.0.0'],
    ['sys-uname', '>= 0.8.3'],
  ]
  p.extra_dev_deps = [
    ['newgem', ">= #{::Newgem::VERSION}"]
  ]

  p.clean_globs |= %w[**/.DS_Store tmp *.log]
  path = (p.rubyforge_name == p.name) ? p.rubyforge_name : "\#{p.rubyforge_name}/\#{p.name}"
  p.remote_rdoc_dir = File.join(path.gsub(/^#{p.rubyforge_name}\/?/,''), 'rdoc')
  p.rsync_args = '-av --delete --ignore-errors'
end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }

task :default => [:spec]