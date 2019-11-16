#!/bin/bash

# Run browserify
browserify editor.js -t brfs -o build.js

# Resolving: TypeError
SED_ERROR='throw new TypeError("\Int cannot represent non-integer value: ".concat((0, _inspect.default)(value)))'
sed -i "s/$SED_ERROR/return null/g" build.js

# Resolving: Variable "$width" got invalid value NaN; Expected type Float. Float cannot represent non numeric value: NaN
SED_ERROR='throw new TypeError("Float cannot represent non numeric value: ".concat((0, _inspect.default)(value)))'
sed -i "s/$SED_ERROR/return null/g" build.js
