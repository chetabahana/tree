#!/bin/bash

# Run browserify
browserify editor.js -t brfs -o build.js --no-babelrc

# Resolving: Error/Warning
REPLACE='return null'
FIND='throw new TypeError("\Int cannot represent non-integer value: ".concat((0, _inspect.default)(value)))'
sed -i "s/$FIND/$REPLACE/g" build.js

FIND="warning$1(false, 'Encountered two children with the same key,"
REPLACE="// warning$1(false, 'Encountered two children with the same key,"
sed -i "s/$FIND/$REPLACE/g" build.js

FIND='"aria-description": error ? error.message : null'
REPLACE='"aria-description": error ? null : null'
sed -i "s/$FIND/$REPLACE/g" build.js
