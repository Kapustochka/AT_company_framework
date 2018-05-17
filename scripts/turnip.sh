#!/bin/bash
set -ev
cd ./howitzer_turnip
bundle install
bundle exec rake rspec
