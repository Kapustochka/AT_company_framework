#!/bin/bash
set -ev
cd ./howitzer_rspec
bundle install
bundle exec rake rspec
