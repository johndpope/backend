# Sourcer
[![Build Status](https://travis-ci.org/pepibumur/sourcer-backend.svg?branch=master)](https://travis-ci.org/pepibumur/sourcer-backend)
[![Dependency Status](https://gemnasium.com/badges/github.com/pepibumur/sourcer-backend.svg)](https://gemnasium.com/github.com/pepibumur/sourcer-backend)
[![codecov](https://codecov.io/gh/pepibumur/sourcer-backend/branch/master/graph/badge.svg)](https://codecov.io/gh/pepibumur/sourcer-backend)

## Setup

- Git clone the project: `git clone https://github.com/pepibumur/sourcer-backend.git`
- Excute `bundle install` in the project dir
- Install Vagramt from [here](https://www.vagrantup.com/)
- Install VirtualBox from [here](https://www.virtualbox.org/wiki/Downloads)
- Setup the Vagrant machine with `vagrant up`
- Access the Vagrant machine with `vagrant ssh`
- Voila :tada:, you can execute `bundle exec rails server` from there.

## Useful commands

- `bundle exec rails db:reset`: Deletes and setup the database.
- `bundle exec rails db:migrate`: Migrates the database.

## Authentication
You can authenticate using OAuth2 accessing the following link:

```
https://sourcer-backend.herokuapp.com/api/auth/github?auth_origin_url=https://sourcer-backend.herokuapp.com
```

## References
- [Ruby GraphQL](http://graphql-ruby.org/guides)
- [GraphQL](http://graphql.org/learn/)
- [Devise](https://github.com/plataformatec/devise)
- [CanCan](https://github.com/ryanb/cancan)
- [Rails DB tasks](http://jacopretorius.net/2014/02/all-rails-db-rake-tasks-and-what-they-do.html)
- [Devise Token Auth](https://github.com/lynndylanhurley/devise_token_auth)
