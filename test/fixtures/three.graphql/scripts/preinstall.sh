#!/bin/bash
# Update npm to the latest
sudo npm install npm@latest -g

# Rename componentWillReceiveProps to UNSAFE_componentWillReceiveProps
# Refereence: https://fb.me/react-derived-state
echo -e "\n$hr\nNPX REACT\n$hr"
rm -rf graphiql.css package-lock.json yarn.lock
npx react-codemod rename-unsafe-lifecycles

# Delete all regenerated files
echo -e "\n$hr\nINSTALL\n$hr"
