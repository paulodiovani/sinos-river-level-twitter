require('coffee-script/register');

var config = require('./lib/config');
var tweets = require('./lib/tweets');
var parser = require('./lib/parser');

exports.search = function(options, cb) {
  config.set(options);
  var query = (options.query === true) ? config.DEFAULT_QUERY : options.query;
  tweets.search.write(query);
  cb(tweets.search.pipe(parser));
};
