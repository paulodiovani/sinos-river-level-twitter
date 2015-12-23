minimist = require('minimist')
sinos    = require('../index.js')

argv = minimist process.argv.slice(2),
  alias:
    search: ['s', 'q', 'query']
    stream: ['w', 'wait', 'l', 'listen']

switch
  # search
  when argv.search
    sinos.search.on 'error', (err) ->
      console.error err

    sinos.search.on 'data', (data) ->
      console.log '%s', data.tweet.text

    query = if argv.search is true then sinos.DEFAULT_QUERY else argv.search
    sinos.search.write query

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
