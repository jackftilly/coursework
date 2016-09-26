<<<<<<< HEAD
const path = require("path");

module.exports = {
  context: __dirname,
  entry: "./frontend/synthesizer.jsx",
  output: {
    path: path.join(__dirname),
    filename: "bundle.js"
=======
var path = require("path");

module.exports = {
  context: __dirname,
  entry: "./frontend/redux_todos.jsx",
  output: {
    path: path.join(__dirname, 'app', 'assets', 'javascripts'),
    filename: "bundle.js",
    devtoolModuleFilenameTemplate: '[resourcePath]',
    devtoolFallbackModuleFilenameTemplate: '[resourcePath]?[hash]'
>>>>>>> old_i/master
  },
  module: {
    loaders: [
      {
        test: [/\.jsx?$/, /\.js?$/],
<<<<<<< HEAD
        exclude: /(node_modules|bower_components)/,
        loader: 'babel',
        query: {
          presets: ['es2015', 'react']
=======
        exclude: /node_modules/,
        loader: 'babel',
        query: {
          presets: ["es2015","react"]
>>>>>>> old_i/master
        }
      }
    ]
  },
  devtool: 'source-maps',
  resolve: {
    extensions: ["", ".js", ".jsx" ]
  }
};
