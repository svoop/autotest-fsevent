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

	##
	# Add waiting hook to prevent fallback to polling after ignored files have changed
	Autotest.add_hook :initialize do
		if (Uname.sysname == 'Darwin' && Uname.release.to_i >= 9) || %w(Linux).include?(Uname.sysname)
			class ::Autotest
				def wait_for_changes
					hook :waiting
					begin
						#     `#{File.join(GEM_PATH, 'fsevent', Uname.sysname.downcase, 'fsevent_sleep')} '#{Dir.pwd}' 2>&1`
						`cd '#{Dir.pwd}'; #{File.join(GEM_PATH, 'fsevent', Uname.sysname.downcase, 'fsevent_sleep')} . 2>&1`
						Kernel.sleep self.sleep
					end until find_files_to_test
				end
			end
		else
			puts
			puts "autotest-fsevent: platform #{Uname.sysname} #{Uname.release} is not supported"
		end
	end
end