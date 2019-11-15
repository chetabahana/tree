#!/bin/bash
echo -e "\n$hr\nPREINSTALL\n$hr"
sudo npm install npm@latest -g

# Delete all regenerated files
rm -rf graphiql.css package-lock.json yarn.lock
echo -e "\n$hr\nNODE INSTALL\n$hr"
