minimist = require('minimist')
sinos    = require('../index.js')

argv = minimist process.argv.slice(2),
  alias:
    search: ['s', 'q', 'query']
    stream: ['w', 'wait', 'l', 'listen']

switch
  # search
  when argv.search
    search = if argv.search is true then null else argv.search
    sinos.search search, (err, tweets) ->
      if err?
        console.error err
        process.exit 1

      console.log tweets

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
