#!/bin/bash

# Run browserify
browserify editor.js -t brfs -o build.js --no-babelrc

# Resolving: TypeError Int cannot represent non-integer value
SED_ERROR='throw new TypeError("\Int cannot represent non-integer value: ".concat((0, _inspect.default)(value)))'
sed -i "s/$SED_ERROR/return null/g" build.js
