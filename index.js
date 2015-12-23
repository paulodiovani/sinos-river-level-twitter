require('coffee-script/register');
require('dotenv').load({silent: true});

var tweets = require('./lib/tweets');

module.exports = {
  search       : tweets.search,
  stream       : tweets.stream,
  DEFAULT_QUERY: process.env.DEFAULT_QUERY
};
