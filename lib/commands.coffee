minimist = require('minimist')
sinos    = require('../index.js')

argv = minimist process.argv.slice(2),
  alias:
    search: ['s', 'q', 'query']
    stream: ['w', 'wait', 'l', 'listen']

switch
  # search
  when argv.search
    query = if argv.search is true then sinos.DEFAULT_QUERY else argv.search
    sinos.search query, (err, tweets) ->
      if err?
        console.error err
        process.exit 1

      for tweet in tweets.statuses
        console.log '%s', tweet.text

  # stream
  when argv.stream

  # print help
  else
    console.log """
    usage: sinos-river-scraper-twitter [OPTIONS]

    OPTIONS:
      -q, --query,
      -s, --search   Search old tweets
      -w, --wait,
      -l, --listen,
      --stream       Wait for new tweets stream
    """
