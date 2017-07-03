#!/usr/bin/env bash

echo -e "\033[1;32m Loading auxiliary functions for provision...\033[0m"

function install {
    echo Installing $1 ...
    shift
    debian_frontend=noninteractive apt-get -y install "$@" >/dev/null 2>&1
    echo -e "\033[1;32m [OK] \033[0m"
}

function vagrant_run {
    echo -e "\n$1:"
    eval "su -l vagrant -c '$2'"
}

function set_timezone {
    # http://manpages.ubuntu.com/manpages/precise/man7/debconf.7.html
    echo "Setting timezone to: '$1'"
    export DEBCONF_NONINTERACTIVE_SEEN=true DEBIAN_FRONTEND=noninteractive
    echo "$1" > /etc/timezone
    dpkg-reconfigure tzdata
}

function install_postgres {
  echo -e "\nInstalling Postgres DB and config..."
  if [ ! -x /usr/bin/psql ]; then
      install 'PostgreSQL' postgresql postgresql-contrib libpq-dev
      sudo -u postgres createuser --superuser vagrant
      sudo -u postgres psql -c "ALTER USER vagrant WITH PASSWORD 'vagrant';"
      sudo -u postgres createdb -O vagrant backend_development
      sudo -u postgres createdb -O vagrant backend_test

      # enable pg_admin access from host machine:
      PG_CONF='/etc/postgresql/9.3/main'
      PUBLIC_IP=$(ip -o -4 addr show eth1 | cut -d ' ' -f 7)
      echo "listen_addresses = '*'" >> $PG_CONF/postgresql.conf
      echo "host all all $PUBLIC_IP trust" >> $PG_CONF/pg_hba.conf
      service postgresql restart
  fi
}

function install_rvm {
  if [ ! -x /home/vagrant/.rvm/scripts/rvm ]; then
      vagrant_run "Getting RVM keyring" 'gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3'
      echo -e "\nInstalling RVM:"
      su -l vagrant -c 'curl -sSL https://get.rvm.io | bash -s -- stable'
      echo -e "\nLoading RVM to continue:"
      su -l vagrant -c 'source $HOME/.rvm/scripts/rvm'
      echo -e "\nInstalling Ruby ($RUBY_VERSION)"
      su -l vagrant -c "rvm use $RUBY_VERSION@$RUBY_GEMSET --default --create --install"
      echo -e "\nInstalling Bundler:"
      su -l vagrant -c 'gem install bundler'
      su -l vagrant -c 'echo "gem: --no-rdoc --no-ri" >> /home/vagrant/.gemrc'
      su -l vagrant -c 'cd /backend; bundle install;'
  fi
}