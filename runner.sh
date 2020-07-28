#!/bin/bash

function setup() {
  yarn
}

function dev() {
  ./bin/webpack-dev-server &
  rails server &
  wait
}


setup
dev
