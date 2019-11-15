#!/bin/bash

echo -e "\n$hr\nINSTALL\n$hr"
npm install -f

# Run browserify
echo -e "\n$hr\nBUILD\n$hr"
browserify editor.js -t brfs -o build.js
npm test

# Resolving: TypeError
SED_ERROR='throw new TypeError("Int cannot represent non-integer value: ".concat((0, _inspect.default)(value)))'
sed -i "s/$SED_ERROR/return null/g" build.js
