###
# NB: for local testing run like:
#
# 1.8.x: ruby -Ilib -rrubygems lib/pakman.rb
# 1.9.x: ruby -Ilib lib/pakman.rb

# core and stlibs

require 'yaml'
require 'pp'
require 'erb'
require 'logger'
require 'optparse'
require 'fileutils'

# rubygems

require 'fetcher'   # fetch (download) files

# our own code

require 'pakman/copier'
require 'pakman/fetcher'
require 'pakman/finder'
require 'pakman/manifest'
require 'pakman/template'
require 'pakman/templater'
require 'pakman/utils'
require 'pakman/version'

require 'pakman/cli/ctx'
require 'pakman/cli/helpers'
require 'pakman/cli/opts'
require 'pakman/cli/runner'
require 'pakman/cli/commands/fetch'
require 'pakman/cli/commands/gen'
require 'pakman/cli/commands/list'


module Pakman

  def self.banner
    "pakman #{VERSION} on Ruby #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) [#{RUBY_PLATFORM}]"
  end

  def self.root
    "#{File.expand_path( File.dirname(File.dirname(__FILE__)) )}"
  end

  def self.main
    Runner.new.run(ARGV)
  end

end  # module Pakman


Pakman.main if __FILE__ == $0