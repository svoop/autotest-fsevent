# coding: utf-8
require_relative 'lib/autotest-fsevent/version'

Gem::Specification.new do |spec|
  spec.name        = 'autotest-fsevent'
  spec.version     = Autotest::FSEvent::VERSION
  spec.summary     = 'Use FSEvent instead of filesystem polling'
  spec.description = <<~END
    Autotest relies on filesystem polling to detect modifications in source
    code files. This is expensive for the CPU, harddrive and battery - and
    unnecesary on Mac OS X 10.5 or higher which comes with the very efficient
    FSEvent core service for this very purpose. This gem teaches autotest how
    to use FSEvent.
  END
  spec.authors     = ['Sven Schwyn']
  spec.email       = ['ruby@bitcetera.com']
  spec.homepage    = 'https://github.com/svoop/autotest-fsevent'
  spec.license     = 'MIT'

  spec.metadata = {
    'homepage_uri'      => spec.homepage,
    'changelog_uri'     => 'https://github.com/svoop/autotest-fsevent/blob/master/CHANGELOG.md',
    'source_code_uri'   => 'https://github.com/svoop/autotest-fsevent',
    'documentation_uri' => 'https://www.rubydoc.info/gems/autotest-fsevent',
    'bug_tracker_uri'   => 'https://github.com/svoop/autotest-fsevent/issues'
  }

  spec.files         = Dir['lib/**/*', 'ext/**/*', 'prebuilt/*', 'post-install.txt']
  spec.require_paths = %w(lib)
  spec.extensions    = ['ext/fsevent/extconf.rb']

  spec.extra_rdoc_files = Dir['README.md', 'CHANGELOG.md', 'LICENSE.txt']
  spec.rdoc_options    += [
    '--title', 'FSEvent for Autotest',
    '--main', 'README.md',
    '--line-numbers',
    '--inline-source',
    '--quiet'
  ]

  spec.post_install_message = "\e[1;32m\n" + ('-' * 79) + "\n\n" + File.read('post-install.txt').strip + "\n\n" + ('-' * 79) + "\n\e[0m"

  spec.add_runtime_dependency 'sys-uname'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency "minitest-autotest"
end
