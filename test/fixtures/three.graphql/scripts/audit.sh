#!/bin/bash

# Run audit
npm audit fix

echo -e "\n$hr\nRESOLVE VERSION\n$hr"
# Resolving: Cannot use GraphQLSchema "[object Object]" from another module or realm.
# https://github.com/matthewmueller/graph.ql/blob/master/package.json
# https://github.com/apollographql/react-apollo/issues/742#issuecomment-338366662
echo Resolving a duplicate version of graphql and use one version only:
find node_modules -name graphql
grep version node_modules/graphql/package.json
rm -rf node_modules/graph.ql/node_modules/graphql
