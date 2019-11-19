#!/bin/bash
# Update npm to the latest
sudo npm install npm@latest -g
npm install --save-dev babelify @babel/core
# Delete all regenerated files
rm -rf graphiql.css package-lock.json yarn.lock
echo -e "\n$hr\nINSTALL\n$hr"
