#!/bin/bash

# Run audit
npm audit fix

echo -e "\n$hr\nLIST VERSION\n$hr"
# https://stackoverflow.com/a/25497068/4058484
npm list --depth=0

echo -e "\n$hr\nFORK VERSION\n$hr"
# Resolving: Cannot use GraphQLSchema "[object Object]" from another module or realm.
# https://github.com/apollographql/react-apollo/issues/742#issuecomment-338366662
# https://github.com/matthewmueller/graph.ql/blob/master/package.json
find node_modules -name graphql
grep version node_modules/graphql/package.json
rm -rf node_modules/graph.ql/node_modules/graphql

# https://stackoverflow.com/a/56515445/4058484
# https://stackoverflow.com/a/34246579/4058484
npm list -g | grep graph

echo -e "\n$hr\nROOT VERSION\n$hr"
# https://stackoverflow.com/a/37211072/4058484
npm i --global qnm
qnm graphql
