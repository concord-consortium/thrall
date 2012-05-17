# Thrall

A command line tool to connect to virtual hosts at CC.


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
