TweetsSearch  = require('./tweets').TweetsSearch
Parser        = require('./parser')

DEFAULT_QUERY = '#RiodosSinos #NovoHamburgo from:ComusaNH'

exports.search = (options, cb) ->
  options.query = DEFAULT_QUERY if options.query is true
  cb new TweetsSearch(options).pipe(new Parser())
