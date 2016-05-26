Readable = require('stream').Readable
Twitter = require('twitter')

###
Readable stream to search tweets
###
class TweetsSearch extends Readable
  constructor: (@options) ->
    super(objectMode: true)
    @_setup()
    @_search()

  _setup: ->
    @client = new Twitter
      consumer_key: @options.key
      consumer_secret: @options.secret
      access_token_key: ''
      access_token_secret: ''

  _search: ->
    query = @options.query
    @client.get 'search/tweets',
      q: query
      result_type: 'recent'
    , (err, tweets, response) =>
      @emit err if err?
      for tweet in tweets.statuses
        @push tweet
      @push null

  _read: ->

exports.TweetsSearch = TweetsSearch
