#!/bin/sh
set -e

rm -f ./tmp/pids/server.pid

bundle exec rails db:migrate RAILS_ENV=production

exec "$@"
