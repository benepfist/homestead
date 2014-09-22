#!/usr/bin/env bash

apt-get install -y ruby-dev
gem install mailcatcher
mailcatcher --http-ip 0.0.0.0

