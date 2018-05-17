#!/bin/bash
set -ev
cd ./howitzer_cucmber
bundle install
bundle exec rake cucumber
