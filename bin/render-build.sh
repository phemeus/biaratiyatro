#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
# bundle exec rake db:migrate # We are using Firebase, but if we use SQLite for internal stuff, we might need this. 
# For now, let's skip db:migrate as we are not using ActiveRecord for business logic.
# If solid_queue or solid_cache needs tables, we might need to run their migrations.
bundle exec rake db:prepare
