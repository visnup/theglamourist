var webpack = require('webpack');
var path = require('path');
var HtmlWebpackPlugin = require('html-webpack-plugin');
var jade = require('jade');

module.exports = {

  devtool: 'source-map',

  entry: {
    main: './index.js',
    vendor: [
      'angular',
      'angular-ui-router',
    ],
  },

  output: {
    path: path.resolve(__dirname, 'public'),
    filename: process.env.NODE_ENV ?
      'bundle-[name]-[chunkhash].js' : 'bundle-[name].js'
  },

  module: {
    loaders: [
      { test: /\.styl$/, loaders: ['style', 'css', 'stylus'] },
      { test: /\.jade$/, loaders: ['jade'] },
      { test: /\.js$/,
        loaders: ['ng-annotate?regexp=^.?angular.*$', 'babel'],
        exclude: /node_modules/ },
    ]
  },

  resolve: {
    extensions: [ '', '.js' ],
  },

  plugins: [
    new HtmlWebpackPlugin({
      templateContent: function(templateParams) {
        var template = path.resolve(__dirname, 'index.jade');
        return jade.renderFile(template, templateParams);
      },
      filename: 'index.html'
    }),
    new webpack.optimize.CommonsChunkPlugin({
      name: 'vendor',
      filename: process.env.NODE_ENV ?
        'bundle-[name]-[chunkhash].js' : 'bundle-[name].js'
    }),
  ],

  devServer: {
  }

};
