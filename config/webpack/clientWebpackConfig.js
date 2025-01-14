// The source code including full typescript support is available at:
// https://github.com/shakacode/react_on_rails_demo_ssr_hmr/blob/master/config/webpack/clientWebpackConfig.js
  // server-bundle is special and should ONLY be built by the serverConfig
  // In case this entry is not deleted, a very strange "window" not found
  // error shows referring to window["webpackJsonp"]. That is because the
  // client config is going to try to load chunks.

const commonWebpackConfig = require('./commonWebpackConfig');

const configureClient = () => {
  const clientConfig = commonWebpackConfig();


  delete clientConfig.entry['server-bundle'];
  clientConfig.optimization = {
    ...clientConfig.optimization,
    runtimeChunk: {
      name: 'runtime', // Give it a specific name
    },
    splitChunks: {
      chunks: 'all',
      cacheGroups: {
        commons: {
          test: /[\\/]node_modules[\\/]/,
          name: 'vendors',
          chunks: 'all',
          priority: -10,
          reuseExistingChunk: true
        }
      }
    }
  };

  // Add output configuration to ensure proper chunk loading
  clientConfig.output = {
    ...clientConfig.output,
    publicPath: 'auto',
    chunkLoadingGlobal: 'webpackChunks' // Add a custom chunk loading global
  };

  return clientConfig;
};


module.exports = configureClient;
