Stream = require('stream')
parser = require('../../lib/parser')

sample_tweet = require('../fixtures/sample_tweet.json')

describe 'sinos-river-level-twitter/parser', ->
  it 'is a stream', ->
    expect(parser).to.be.instanceof Stream

  describe 'when parsing tweets', ->
    before (done) ->
      parser.on 'error', done
      parser.on 'data', (@tweet) =>
        done()
      parser.write sample_tweet

    it 'can read date created', ->
      expect(@tweet.tweet.created_at).to.be.eql 'Wed May 25 11:18:04 +0000 2016'

    it 'can read user screen name', ->
      expect(@tweet.user.screen_name).to.be.eql 'ComusaNH'

    it 'can read measure time', ->
      expect(@tweet.measure.time).to.be.eql '6'

    it 'can read measure level', ->
      expect(@tweet.measure.meters).to.be.eql '4,77'
