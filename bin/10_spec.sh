#!/usr/bin/env bash
for i in {1..10}
do
  bundle exec rspec $1
done
