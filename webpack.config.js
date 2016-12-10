var path = require('path');
var glob = require('glob-fs')({ gitignore: true });
var webpack = require('webpack');

var controllers = glob.readdirSync('./app/assets/javascripts/controllers/**/*.js').map(function (controller) {
  return path.resolve(__dirname, controller);
});

var specs = glob.readdirSync('./spec/javascripts/**/*_spec.js').map(function (test) {
  return path.resolve(__dirname, test);
});

var jsAssetsDirectory = path.join(__dirname, 'app', 'assets', 'javascripts');

module.exports = {
  entry: {
    webpack_bundle: controllers,
    webpack_spec_bundle: specs,
  },
  output: {
    path: jsAssetsDirectory,
    filename: '[name].js',
  },
  devtool: 'source-map',
  resolve: {
    root: jsAssetsDirectory,
  },
  module: {
    loaders: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel', // 'babel-loader' is also a valid name to reference
        query: {
          presets: ['latest'],
        },
      },
    ],
  },
};
