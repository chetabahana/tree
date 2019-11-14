#!/bin/bash

# Resolving: Cannot use GraphQLSchema "[object Object]" from another module or realm.
# https://github.com/apollographql/react-apollo/issues/742#issuecomment-338366662
find node_modules -name graphql
grep version node_modules/graphql/package.json
rm -rf node_modules/graph.ql/node_modules/graphql

# Resolving: TypeError
SED_ERROR='throw new TypeError("Int cannot represent non-integer value: ".concat((0, _inspect.default)(value)))'
sed -i "s/$SED_ERROR/return null/g" build.js

# Copy graphiql.css to current directory
cp -f node_modules/graphiql/graphiql.css .
