#!/bin/bash

# Update npm to the latest
sudo npm install npm@latest -g

# Delete all regenerated files
rm -rf graphiql.css package-lock.json yarn.lock
