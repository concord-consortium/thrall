
# CORE FUNCTIONS:
# cc ssh <host>     -- connect to host
# cc update         -- update server list
# cc list [exp]     -- print mapping for hosts matching exp

require 'thor'
require 'thrall'

module Thrall
  class CLI < Thor
  
    desc "shh [short_name]", "connect to the server responsible for short_name (eg: rites-dev)"
    def ssh(short_name)
      @server = Core.new()
      exec @server.ssh_cmds(short_name)
    end

    desc "screen [short_name]", "connect to a shared screen session on short-name"
    def screen(short_name)
      @server = Core.new()
      exec @server.screen_cmds(short_name)
    end

    desc "www [short_name]", "open a browser to short_name (eg: rites-dev)"
    def www(short_name)
      @server = Core.new()
      exec @server.www_cmds(short_name)
    end

    desc "list [regexp]", "list short_names matching [regexp]"
    def list(short_name)
      @server = Core.new()
      @server.list(short_name)
    end
  end
end