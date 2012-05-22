
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

require 'yaml'

module Thrall
  DEFAULT_USER        = 'deploy'
  DEFAULT_CONFIG_FILE = File.join(File.dirname(__FILE__),"thrall.yml")

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

    def find(short_name)
      return self.host_defs.select {|k,v| k.match(short_name) or v['fqdn'].match(short_name) }
    end

    def list(short_name)
      matching = self.find(short_name)
      matching.each_pair do |name, record|
        self.print_host_record(name, record)
      end
    end  
          
    def print_host_record(name,record)
        puts "#{name}"
        puts "\tHost: #{record['host']}"
        puts "\tPath: #{record['path']}"
        puts "\tFqdn: #{record['fqdn']}"
        puts "\tBastion: #{record['bastion']}"
    end

    def screen_cmds(short_name)
      self.ssh_cmds(short_name, "screen -xR #{short_name}")
    end

    def ssh_cmds(short_name,remote_cmd="bash -l")
      host = self.host(short_name)['host']
      cd   = ""
      cd   = "cd #{self.host(short_name)['path']}; " if self.host(short_name)['path']
      bastion = self.host(short_name)['bastion']
      
      command = "ssh -t #{self.user}@#{host} '#{cd}#{remote_cmd}'" 
      command = "ssh -At #{bastion} \"#{command}\"" if bastion
      command
    end

    def www_cmds(short_name)
      fqdn = self.host(short_name)['fqdn']
      "open http://#{fqdn}"
    end
  end
end

# me = Serverator::Cli.new()
# me.ssh(ARGV[0])

