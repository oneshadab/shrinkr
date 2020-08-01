#!/bin/bash

function setup() {
  rake db:migrate
  yarn
}

function dev() {
  ./bin/webpack-dev-server &
  rails server &
  wait
}


setup
dev
