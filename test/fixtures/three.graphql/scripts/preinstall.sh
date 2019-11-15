#!/bin/bash
sudo npm install npm@latest -g

# Delete all regenerated files
rm -rf graphiql.css package-lock.json yarn.lock
echo -e "\n$hr\nINSTALL\n$hr"
