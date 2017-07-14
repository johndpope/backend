#!/bin/bash

# Load auxiliary functions:
source /backend/scripts/provision/functions.sh

RUBY_VERSION="2.3.1"
RUBY_GEMSET="sourcer-backend"
HOSTNAME="sourcer-backend.dev"

# System

echo Updating package information...
apt-get -y update >/dev/null 2>&1

set_timezone 'Europe/Madrid'
hostname $HOSTNAME
sudo locale-gen es_ES.UTF-8

install 'Base system' build-essential sed grep tar curl git-core \
  gawk libreadline6-dev zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev \
  sqlite3 autoconf libgdbm-dev libncurses5-dev automake libtool bison \
  pkg-config libffi-dev libxml2-dev libxslt-dev libgmp3-dev libxml2 nodejs

install_postgres

install_rvm

# redis-server
install 'Redis' redis-server
install 'Memcached' memcached
install 'ImageMagick' imagemagick
install 'PhantomJS' phantomjs

# Developer happiness stuff:
install 'ACK-Grep' ack-grep
install 'Log colorizer' ccze
install 'Vim' vim

echo -e "\033[1;32m All set, rock on!\033[0m"
