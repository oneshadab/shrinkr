const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')

const vue = require('./loaders/vue')
const customConfig = require('./custom');

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)

environment.config.merge(customConfig);

module.exports = environment
