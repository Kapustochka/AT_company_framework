#!/bin/bash
set -ev
cd ./howitzer_rspec
bundle install
wget https://chromedriver.storage.googleapis.com/2.38/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
sudo cp chromedriver /usr/local/bin/chromedriver
sleep 3
bundle exec rake rspec
