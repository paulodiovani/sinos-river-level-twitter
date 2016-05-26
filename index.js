require('coffee-script/register');

var TweetsSearch = require('./lib/tweets').TweetsSearch;
var Parser       = require('./lib/parser');

var DEFAULT_QUERY = '#RiodosSinos #NovoHamburgo from:ComusaNH';

exports.search = function(options, cb) {
  if (options.query === true) options.query = DEFAULT_QUERY;
  cb(new TweetsSearch(options).pipe(new Parser()));
};
