# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{autotest-fsevent}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sven Schwyn"]
  s.date = %q{2009-06-03}
  s.description = %q{ZenTest's autotest relies on filesystem polling to detect modifications in source code files. This is expensive for the CPU, harddrive and battery - and unnecesary on Mac OS X 10.5 or higher which comes with the very efficient FSEvent core service for this purpose. This gem teaches autotest how to use FSEvent.}
  s.email = ["ruby@bitcetera.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc"]
  s.files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "fsevent/fsevent_sleep", "lib/autotest-fsevent.rb", "lib/autotest/fsevent.rb", "script/console", "script/destroy", "script/generate", "spec/autotest-fsevent_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "tasks/rspec.rake"]
  s.homepage = %q{http://www.bitcetera.com/products/autotest-fsevent}
  s.post_install_message = %q{
[1;32mIn order to use autotest-fsevent, the following line has to be added *after*
all other requires in your ~/.autotest file:

require 'autotest/fsevent'

For more information, feedback and bug submissions, please visit:

See http://www.bitcetera.com/products/mac-fsevent
[0;30m
}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{autotest-fsevent}
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{Use FSEvent (on Mac OS X 10.5 or higher) instead of filesystem polling.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ZenTest>, [">= 4.0.0"])
      s.add_runtime_dependency(%q<sys-uname>, [">= 0.8.3"])
      s.add_development_dependency(%q<newgem>, [">= 1.4.1"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<ZenTest>, [">= 4.0.0"])
      s.add_dependency(%q<sys-uname>, [">= 0.8.3"])
      s.add_dependency(%q<newgem>, [">= 1.4.1"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<ZenTest>, [">= 4.0.0"])
    s.add_dependency(%q<sys-uname>, [">= 0.8.3"])
    s.add_dependency(%q<newgem>, [">= 1.4.1"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
