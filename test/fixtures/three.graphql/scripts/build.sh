#!/bin/bash

# Run browserify
browserify editor.js -t brfs -o build.js

# Rename componentWillReceiveProps to UNSAFE_componentWillReceiveProps
# Refereence: https://fb.me/react-derived-state
npx react-codemod rename-unsafe-lifecycles

# Resolving: TypeError Int cannot represent non-integer value
SED_ERROR='throw new TypeError("\Int cannot represent non-integer value: ".concat((0, _inspect.default)(value)))'
sed -i "s/$SED_ERROR/return null/g" build.js

# Resolving: Variable "$width" got invalid value NaN; Expected type Float. Float cannot represent non numeric value: NaN
#SED_ERROR='throw new TypeError("Float cannot represent non numeric value: ".concat((0, _inspect.default)(value)))'
#sed -i "s/$SED_ERROR/return null/g" build.js
