argv = require('minimist') process.argv.slice(2),
  alias:
    search: ['s', 'q', 'query']
    key:    ['twitter-key', 'twitter-consumer-key']
    secret: ['twitter-secret', 'twitter-secconsumer-ret']
    help:   ['h']

sinos = require('../index')

###
Prints help information
###
print_help = ->
  console.log """
  usage: sinos-river-scraper-twitter [OPTIONS]

  OPTIONS:
    -q, --query,
    -s, --search   Search old tweets

    --twitter-key
    --key          Twitter consumer key

    --twitter-secret
    --secret       Twitter consumer secret

    --help, -h     This help
  """
  process.exit 0

###
Check for required params
###
check_params = ->
  unless argv.key? and argv.secret?
    console.warn "Twitter consumer key and secret must be provided.\n"
    print_help()

switch
  # help
  when argv.help?
    print_help()

  # search
  when argv.search?
    check_params()
    {key, secret, query} = argv
    sinos.search {query, key, secret}, (tweets) ->
      tweets.on 'error', (err) ->
        console.error err

      tweets.on 'data', (data) ->
        console.log 'Measure in %s, at %sh: %sm',
          data.tweet.created_at,
          data.measure.time,
          data.measure.meters

  # print help
  else
    print_help()
