#!/bin/bash

# Update npm to the latest
echo -e "\n$hr\nUPDATE\n$hr"
sudo npm install npm@latest -g

# Delete all regenerated files
rm -rf graphiql.css package-lock.json yarn.lock
