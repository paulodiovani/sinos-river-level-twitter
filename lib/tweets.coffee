Twitter = require('twitter')
through = require('through')
config  = require('./config')

###
Create/get a new twitter client
###
client = ->
  new Twitter
    consumer_key: config.TWITTER_CONSUMER_KEY
    consumer_secret: config.TWITTER_CONSUMER_SECRET
    access_token_key: config.TWITTER_ACCESS_TOKEN_KEY
    access_token_secret: config.TWITTER_ACCESS_TOKEN_SECRET

###
Stream to search tweets.
###
tweets_search = through (query) ->
  # search twitter and write to stream
  client().get 'search/tweets', {q: query}, (err, tweets, response) =>
    return @emit 'error', err if err?
    for tweet in tweets.statuses
      @emit 'data', tweet
    @emit 'end'

tweets_stream = through ->

module.exports =
  search: tweets_search
  stream: tweets_stream
