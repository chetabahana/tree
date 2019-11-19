#!/bin/bash

# Run browserify
browserify editor.js -t brfs -o build.js --no-babelrc

# Resolving: TypeError Int cannot represent non-integer value
FIND='throw new TypeError("\Int cannot represent non-integer value: ".concat((0, _inspect.default)(value)))'
REPLACE='return null'
sed -i "s/$FIND/$REPLACE/g" build.js

FIND="warning$1(false, 'Encountered two children with the same key, `%s`. ' + 'Keys should be unique so that components maintain their identity ' + 'across updates. Non-unique keys may cause children to be ' + 'duplicated and/or omitted — the behavior is unsupported and ' + 'could change in a future version.', key);"
REPLACE="//warning$1(false, 'Encountered two children with the same key, `%s`. ' + 'Keys should be unique so that components maintain their identity ' + 'across updates. Non-unique keys may cause children to be ' + 'duplicated and/or omitted — the behavior is unsupported and ' + 'could change in a future version.', key);"
sed -i "s/$FIND/$REPLACE/g" build.js

FIND='"aria-description": error ? error.message : null'
REPLACE='//"aria-description": error ? error.message : null'
sed -i "s/$FIND/$REPLACE/g" build.js
