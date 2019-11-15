#!/bin/bash

# Run audit
echo -e "\n$hr\nNPM AUDIT\n$hr"
npm i --package-lock-only
npm audit fix

# Resolving: Cannot use GraphQLSchema "[object Object]" from another module or realm.
# https://github.com/apollographql/react-apollo/issues/742#issuecomment-338366662
echo -e "\n$hr\nVERSION\n$hr"
find node_modules -name graphql
grep version node_modules/graphql/package.json
rm -rf node_modules/graph.ql/node_modules/graphql

# Copy graphiql.css to current directory
cp -f node_modules/graphiql/graphiql.css .
echo -e "\n$hr\nBUILD\n$hr"
