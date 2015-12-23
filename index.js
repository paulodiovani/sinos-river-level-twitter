require('coffee-script/register');
require('dotenv').load({silent: true});

var pipeline = require('./lib/pipeline');

module.exports = {
  search       : pipeline.search,
  stream       : {},
  DEFAULT_QUERY: process.env.DEFAULT_QUERY
};
