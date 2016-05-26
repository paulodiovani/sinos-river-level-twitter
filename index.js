require('coffee-script/register');

var tweets = require('./lib/tweets');
var parser = require('./lib/parser');

var DEFAULT_QUERY = '#RiodosSinos #NovoHamburgo from:ComusaNH';

exports.search = function(options, cb) {
  if (options.query === true) options.query = DEFAULT_QUERY;
  tweets.search.write(options);
  cb(tweets.search.pipe(parser));
};
