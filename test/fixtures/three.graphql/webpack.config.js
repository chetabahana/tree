const path = require('path');
module.exports = {
  target: 'node',
  mode: 'production',
  devtool: 'source-map',
  externals: [ nodeExternals() ]
};
