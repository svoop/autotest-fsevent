require 'rubygems'
require 'autotest'

$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

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

  VERSION  = '0.1.0'
  GEM_PATH = File.expand_path(File.join(File.dirname(__FILE__), '../..'))

  ##
  # Use FSEvent if possible
  Autotest.add_hook :waiting do
    if RUBY_PLATFORM.match(/darwin(\d+)\.?(\d+)?/) && ($1.to_i >= 9 || ($1.to_i == 8 && $2.to_i >= 9))
      `#{File.join(GEM_PATH, 'fsevent', 'fsevent_sleep')} '#{Dir.pwd}' 2>&1`
    else
      puts
      puts "autotest-fsevent: #{RUBY_PLATFORM} not supported, please file a bug if you are on Mac OS X 10.5 or above."
    end
  end

end
