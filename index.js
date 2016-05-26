require('coffee-script/register');

var pipeline = require('./lib/pipeline');
var config   = require('./lib/config');

exports.search = function(options, cb) {
  set_config(options);
  var query = (options.query === true) ? config.DEFAULT_QUERY : options.query;
  pipeline.search.write(query);
  cb(pipeline.search);
};

/**
 * Set configuration options
 */
function set_config(options) {
  if (options.key)    config.TWITTER_CONSUMER_KEY    = options.key;
  if (options.secret) config.TWITTER_CONSUMER_SECRET = options.secret;
}
