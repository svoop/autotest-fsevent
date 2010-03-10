# Workaround to make Rubygems believe it builds a native gem

def emulate_extension_install(extension_name)
  File.open('Makefile', 'w') { |f| f.write "all:\n\ninstall:\n\n" }
  File.open('make', 'w') do |f|
    f.write '#!/bin/sh'
    f.chmod f.stat.mode | 0111
  end
  File.open(extension_name + '.so', 'w') {}
  File.open(extension_name + '.dll', 'w') {}
  File.open('nmake.bat', 'w') { |f| }
end

emulate_extension_install('fsevent')


# Compile the actual fsevent_sleep binary

raise "Only Darwin (Mac OS X) systems are supported" unless `uname -s`.chomp == 'Darwin'

GEM_ROOT       = File.expand_path(File.join('..', '..'))
DARWIN_VERSION = `uname -r`.to_i
SDK_VERSION    = { 9 => '10.5', 10 => '10.6', 11 => '10.7' }[DARWIN_VERSION]

raise "Darwin #{DARWIN_VERSION} is not (yet) supported" unless SDK_VERSION

`mkdir -p #{File.join(GEM_ROOT, 'bin')}`
`CFLAGS='-isysroot /Developer/SDKs/MacOSX#{SDK_VERSION}.sdk -mmacosx-version-min=#{SDK_VERSION}' /usr/bin/gcc -framework CoreServices -o "#{GEM_ROOT}/bin/fsevent_sleep" fsevent_sleep.c`

raise "Compilation of fsevent_sleep failed (see README)" unless File.executable?("#{GEM_ROOT}/bin/fsevent_sleep")
