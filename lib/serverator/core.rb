
# CORE FUNCTIONS:
# cc ssh <host>     -- connect to host
# cc update         -- update server list
# cc list [exp]     -- print mapping for hosts matching exp


# SECONDARY FUNCTIONS:
# cc web <host>     -- open web browser to host
# cc console <host> -- open console to host
# cc scp ?
# dump / upload db?
# local repo map?

module Serverator
  DEFAULT_USER        = 'deploy'
  DEFAULT_CONFIG_FILE = File.join(File.dirname(__FILE__),"serverator.yml")

  class Core
    attr_accessor :host_defs
    attr_accessor :config_file
    attr_accessor :user

    def initialize(opts={})
      self.config_file = opts[:config_file] || DEFAULT_CONFIG_FILE 
      self.user        = opts[:user]        || DEFAULT_USER
      self.host_defs   = opts[:host_defs]   || self.load_definitions
    end
    
    def load_definitions
      YAML.load_file(self.config_file)
    end

    def host(short_name)
      self.host_defs[short_name]
    end

    def ssh_cmds(short_name)
      host = self.host(short_name)['host']
      "ssh #{self.user}@#{host}"
    end

    def www_cmds(short_name)
      fqdn = self.host(short_name)['fqdn']
      "open http://#{fqdn}"
    end

    def ssh(short_name)
      exec ssh_cmds(short_name)
    end

  end
end

# me = Serverator::Cli.new()
# me.ssh(ARGV[0])

