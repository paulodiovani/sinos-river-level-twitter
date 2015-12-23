Twitter = require('twitter')

client = new Twitter
  consumer_key: process.env.TWITTER_CONSUMER_KEY
  consumer_secret: process.env.TWITTER_CONSUMER_SECRET
  access_token_key: process.env.TWITTER_ACCESS_TOKEN_KEY
  access_token_secret: process.env.TWITTER_ACCESS_TOKEN_SECRET

tweets_search = (query = '#RiodosSinos', callback) ->
  client.get 'search/tweets', q: query, (err, tweets, response) ->
    callback(err, tweets)

tweets_stream = ->

module.exports =
  search: tweets_search
  stream: tweets_stream
