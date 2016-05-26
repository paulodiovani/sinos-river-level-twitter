Transform = require('stream').Transform

TWEET_RE = ///
    ^.*
    (([0-9]|0[0-9]|1[0-9]|2[0-3])(:[0-5][0-9])?)h # time    [1]
    .*
    ([0-9]+\,[0-9]{2})m                           # measure [4]
    .*$
  ///

###
Parse twitter text for reading river
  measurements.

@param {Object} tweet
###
parse_tweet = (tweet) ->
  return null unless TWEET_RE.test tweet.text
  matches = TWEET_RE.exec tweet.text

  tweet:
    id: tweet.id
    id_str: tweet.id_str
    text: tweet.text
    created_at: tweet.created_at
    lang: tweet.lang
  user:
    id: tweet.user.id
    id_str: tweet.user.id_str
    screen_name: tweet.user.screen_name
  measure:
    time: matches[1]
    meters: matches[4]

###
Parser transform stream
###
class Parser extends Transform
  constructor: ->
    super(objectMode: true)

  _transform: (chunk, encoding, callback) ->
    if parsed = parse_tweet(chunk)
      @push parsed
    callback()

module.exports = Parser
