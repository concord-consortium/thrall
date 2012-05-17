
# CORE FUNCTIONS:
# cc ssh <host>     -- connect to host
# cc update         -- update server list
# cc list [exp]     -- print mapping for hosts matching exp

require 'thor'
require 'Serverator'
module Serverator
  DEFAULT_USER        = 'deploy'
  DEFAULT_CONFIG_FILE = File.join(File.dirname(__FILE__),"serverator.yml")

  class CLI < Thor
    desc "shh short_name", "connect to the server responsible for short_name (eg: rites-dev)"
    def ssh(short_name)
      @server = Core.new()
      exec @server.ssh_cmds(short_name)
    end

    desc "www short_name", "open a browser to short_name (eg: rites-dev)"
    def www(short_name)
      @server = Serverator::Core.new()
      exec @server.www_cmds(short_name)
    end
  end
end

# me = Serverator::Cli.new()
# me.ssh(ARGV[0])

