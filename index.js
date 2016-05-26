require('coffee-script/register');

var pipeline = require('./lib/pipeline');
var config   = require('./lib/config');

exports.search = function(options, cb) {
  config.set(options);
  var query = (options.query === true) ? config.DEFAULT_QUERY : options.query;
  pipeline.search.write(query);
  cb(pipeline.search);
};
