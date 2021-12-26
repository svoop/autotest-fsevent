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

if `uname -s`.chomp == 'Darwin'
  gem_root = File.expand_path(File.join('..', '..'))
  darwin_version = `uname -r`.to_i
  sdk_version = darwin_version < 20 ? "10.#{darwin_version - 4}" : darwin_version - 9

  `mkdir -p #{File.join(gem_root, 'bin')}`
  if ENV.has_key?('FSEVENT_SLEEP')
    require 'fileutils'
    FileUtils.cp(ENV['FSEVENT_SLEEP'], "#{gem_root}/bin/fsevent_sleep", :preserve => true)
    fail "Installation of fsevent_sleep binary failed - see README for assistance" unless File.executable?("#{gem_root}/bin/fsevent_sleep")
  elsif File.exists?('/Developer/Applications/Xcode.app')
    `CFLAGS='-isysroot /Developer/SDKs/MacOSX#{sdk_version}.sdk -mmacosx-version-min=#{sdk_version}' /usr/bin/gcc -framework CoreServices -o "#{gem_root}/bin/fsevent_sleep" fsevent_sleep.c`
    fail "Compilation of fsevent_sleep binary failed - see README for assistance" unless File.executable?("#{gem_root}/bin/fsevent_sleep")
  elsif File.exists?('/Applications/Xcode.app') # Xcode 4.3
    `CFLAGS='-isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX#{sdk_version}.sdk -mmacosx-version-min=#{sdk_version}' /usr/bin/gcc -framework CoreServices -o "#{gem_root}/bin/fsevent_sleep" fsevent_sleep.c`
    fail "Compilation of fsevent_sleep binary failed - see README for assistance" unless File.executable?("#{gem_root}/bin/fsevent_sleep")
  else
    fail "Xcode not found - see README for assistance"
  end
end
