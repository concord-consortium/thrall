# Thrall

A command–line tool to connect to v-hosts at CC.

We wanted something that would let us easily ssh into servers without looking up where it lived.

* we keep the mapping of application names, to machine names in a git repo [TODO]
* we make a command uses that mapping to run the appropriate ssh command  [✔]
* ideally it would be integrated with command completion so tab-tab would show the list of applications. [TODO]
* the command would have an "update" option to update its git repository. [TODO]
* we could expand this to also open a browser pointed to the application. [✔]

## Installing locally from git:

Check out this repo:

    git co git@github.com:concord-consortium/thrall.git

And then execute:

    $ rake install

If everything goes OK, you should be now have a "thor" executable in your path for your current ruby environment.


## Usage

Connect to a host:

    thrall ssh <shortname>

open a browser:

    thrall www <shortname>


## TODO:

* document desired behavior
* 'thrall list' known hosts or regexp
* shared config file & host list through gist or github.
* ssh should cd into virtual servers directory.
* write tests
