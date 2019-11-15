#!/bin/bash

echo -e "\n$hr\nAUDIT\n$hr"
sleep 5 && npm audit fix

echo -e "\n$hr\nFIX\n$hr"
# Resolving: Cannot use GraphQLSchema "[object Object]" from another module or realm.
# https://github.com/apollographql/react-apollo/issues/742#issuecomment-338366662
find node_modules -name graphql
grep version node_modules/graphql/package.json
rm -rf node_modules/graph.ql/node_modules/graphql

# Copy graphiql.css to current directory
cp -f node_modules/graphiql/graphiql.css .
