#!/bin/bash

# Run audit
npm audit fix

echo -e "\n$hr\nRESOLVE VERSION\n$hr"
# Resolving: Cannot use GraphQLSchema "[object Object]" from another module or realm.
# https://github.com/apollographql/react-apollo/issues/742#issuecomment-338366662
# https://github.com/matthewmueller/graph.ql/blob/master/package.json
# https://stackoverflow.com/a/56515445/4058484
find node_modules -name graphql
grep version node_modules/graphql/package.json
rm -rf node_modules/graph.ql/node_modules/graphql

echo -e "\n$hr\LIST VERSION\n$hr"
npm -g ls --depth=0
