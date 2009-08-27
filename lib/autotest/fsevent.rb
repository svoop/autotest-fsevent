require 'rubygems'
require 'autotest'
require 'sys/uname'

include Sys

##
# Autotest::FSEvent
#
# == FEATUERS:
# * Use FSEvent (on Mac OS X 10.5 or higher) instead of filesystem polling
#
# == SYNOPSIS:
# ~/.autotest
#   require 'autotest/fsevent'
module Autotest::FSEvent

  GEM_PATH = File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))

  ##
  # Use FSEvent if possible
  Autotest.add_hook :waiting do
    if (Uname.sysname == 'Darwin' && Uname.release.to_i >= 9) || %w(Linux).include?(Uname.sysname)
      `#{File.join(GEM_PATH, 'fsevent', Uname.sysname.downcase, 'fsevent_sleep')} '#{Dir.pwd}' 2>&1`
    else
      puts
      puts "autotest-fsevent: platform #{Uname.sysname} #{Uname.release} is not supported"
    end
  end

  Autotest.add_hook :initialize do
    class ::Autotest
      def wait_for_changes
        begin
          hook :waiting
          Kernel.sleep self.sleep
        end until find_files_to_test
      end
    end
  end

end
