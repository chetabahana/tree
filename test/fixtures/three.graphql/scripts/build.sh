#!/bin/bash

# Run browserify
browserify editor.js -t brfs -o build.js --no-babelrc

# Resolving: Error/Warning
FIND='throw new TypeError("\Int cannot represent non-integer value: ".concat((0, _inspect.default)(value)))'
REPLACE='return null'
sed -i "s/$FIND/$REPLACE/g" build.js

FIND="// warning$1(false, 'Encountered two children with the same key,"
REPLACE=""
sed -i "s/$FIND/$REPLACE/g" build.js

FIND='"aria-description": error ? error.message : null'
REPLACE='"aria-description": error ? null : null'
sed -i "s/$FIND/$REPLACE/g" build.js
