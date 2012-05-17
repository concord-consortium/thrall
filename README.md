# Thrall

A command–line tool to connect to v-hosts at CC.

I wanted something that would let me easily ssh into the server without looking up which one it was in the config/deploy/*.rb folder.


* we keep the mapping of application names, to machine names in a git repo [TODO]
* we make a command uses that mapping to run the appropriate ssh command  [✔]
* ideally it would be integrated with command completion so tab-tab would show the list of applications. [TODO]
* the command would have an "update" option to update its git repository. [TODO]
* we could expand this to also open a browser pointed to the application. [✔]

## Installation

Add this line to your application's Gemfile:

    gem 'thrall'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install thrall

## Usage

Connect to a host:

    thrall ssh <shortname>

open a browser:

    thrall www <shortname>

## TODO:

* list known hosts
* better config file hosting
* use gist or github to maintain server list
* change into virtual servers directory
* more tests


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
