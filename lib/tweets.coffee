Twitter = require('twitter')
through = require('through')

###
Create/get a new twitter client
###
client = (options) ->
  new Twitter
    consumer_key: options.key
    consumer_secret: options.secret
    access_token_key: ''
    access_token_secret: ''

###
Stream to search tweets.
###
tweets_search = through (options) ->
  # search twitter and write to stream
  client(options).get 'search/tweets', {q: options.query}, (err, tweets, response) =>
    return @emit 'error', err if err?
    for tweet in tweets.statuses
      @emit 'data', tweet
    @emit 'end'

tweets_stream = through ->

module.exports =
  search: tweets_search
  stream: tweets_stream
