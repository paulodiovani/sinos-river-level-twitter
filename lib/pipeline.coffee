through = require('through')
tweets  = require('./tweets')
parser  = require('./parser')

###
pipeline stream
  pipes process streams
###
search_pipeline = through (data) ->
  parser.on 'error', (err) =>
    @emit 'error', (err)

  parser.on 'data', (data) =>
    @emit 'data', data

  tweets.search
    .pipe parser

  tweets.search.write data

module.exports =
  search: search_pipeline
