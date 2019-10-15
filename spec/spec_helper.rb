gem 'minitest'

require 'pathname'

require 'minitest/autorun'
require Pathname(__dir__).join('..', 'lib', 'autotest-fsevent')
