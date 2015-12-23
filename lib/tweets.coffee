Twitter = require('twitter')
through = require('through')

client = new Twitter
  consumer_key: process.env.TWITTER_CONSUMER_KEY
  consumer_secret: process.env.TWITTER_CONSUMER_SECRET
  access_token_key: process.env.TWITTER_ACCESS_TOKEN_KEY
  access_token_secret: process.env.TWITTER_ACCESS_TOKEN_SECRET

###
Stream to search tweets.
###
tweets_search = through (query) ->
  # search twitter and write to stream
  client.get 'search/tweets', {q: query}, (err, tweets, response) =>
    return @emit 'error', err if err?
    for tweet in tweets.statuses
      @emit 'data', tweet
    @emit 'end'

tweets_stream = through ->

module.exports =
  search: tweets_search
  stream: tweets_stream
