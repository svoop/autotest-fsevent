require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "autotest-fsevent"
    gem.summary = %Q{Use FSEvent (on Mac OS X 10.5 or higher) instead of filesystem polling.}
    gem.description = %Q{Autotest relies on filesystem polling to detect modifications in source code files. This is expensive for the CPU, harddrive and battery - and unnecesary on Mac OS X 10.5 or higher which comes with the very efficient FSEvent core service for this very purpose. This gem teaches autotest how to use FSEvent.}
    gem.email = "ruby@bitcetera.com"
    gem.homepage = "http://www.bitcetera.com/products/autotest-fsevent"
    gem.authors = ["Sven Schwyn"]
    gem.post_install_message = "\n\e[1;32m" + File.read('PostInstall.txt') + "\e[0m\n"
    gem.files = [
      "CHANGELOG.txt",
      "fsevent/darwin/fsevent_sleep",
      "lib/autotest/fsevent.rb"
    ]
    gem.add_development_dependency "rspec", ">= 1.3.0"
    gem.add_dependency "autotest", ">= 4.2.4"
    gem.add_dependency "sys-uname"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "autotest-fsevent #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
