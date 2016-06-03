# # Index
#
# The main module exports a series of methods that pass a
# Readable Stream to the callback function.

TweetsSearch  = require('./tweets').TweetsSearch
Parser        = require('./parser')

DEFAULT_QUERY = '#RiodosSinos #NovoHamburgo from:ComusaNH'

# ## Search tweets
#
# - `options` Search options
#   - `key` Twitter consumer key
#   - `secret` Twitter consumer secret
#   - `query` Search query
# - `cb`      Callback function to receive a Readable Stream
#
# ### Usage
#
# ```javascript
# var sinos = require('sinos-river-level-twitter');
#
# //search tweets with level data
# sinos.search({
#   query: '#RiodosSinos #NovoHamburgo from:ComusaNH',
#   key: 'bc254ea08faf45c216fada14d64edf71',
#   secret: '99cbd9758755f8e9e55aa2be5acb75da'
# }, function(tweets) {
#   //tweets is a readable stream where every tweet emits data
#   tweets.on('error', console.err);
#   tweets.on('data', function(tweet) {
#     console.log('Level in %s is %sm', data.tweet.created_at, data.measure.meters);
#   });
# });
# ```
exports.search = (options, cb) ->
  options.query = DEFAULT_QUERY if options.query is true
  cb new TweetsSearch(options).pipe(new Parser())
