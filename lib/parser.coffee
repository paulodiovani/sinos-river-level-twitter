through = require('through')

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
Stream to parse tweets data
###
tr = through (data) ->
  if parsed = parse_tweet(data)
    @emit 'data', parsed
, ->
  @emit 'end'

module.exports = tr
