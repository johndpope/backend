# Issues
[![Build Status](https://travis-ci.org/pepibumur/issues-backend.svg?branch=master)](https://travis-ci.org/pepibumur/issues-backend)
[![Dependency Status](https://gemnasium.com/badges/github.com/pepibumur/issues-backend.svg)](https://gemnasium.com/github.com/pepibumur/issues-backend)
[![codecov](https://codecov.io/gh/pepibumur/issues-backend/branch/master/graph/badge.svg)](https://codecov.io/gh/pepibumur/issues-backend)

## Setup

- Git clone the project: `git clone https://github.com/pepibumur/issues-backend.git`
- Excute `bundle install` in the project dir
- Install Vagramt from [here](https://www.vagrantup.com/)
- Install VirtualBox from [here](https://www.virtualbox.org/wiki/Downloads)
- Setup the Vagrant machine with `vagrant up`
- Access the Vagrant machine with `vagrant ssh`
- Voila :tada:, you can execute `bundle exec rails server` from there.

## Useful commands

- `bundle exec rails db:reset`: Deletes and setup the database.
- `bundle exec rails db:migrate`: Migrates the database.

## References
- [Ruby GraphQL](http://graphql-ruby.org/guides)
- [Devise](https://github.com/plataformatec/devise)
- [CanCan](https://github.com/ryanb/cancan)