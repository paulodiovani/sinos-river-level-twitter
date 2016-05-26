Stream  = require('stream')
Twitter = require('twitter')
sinos   = require('../index')
config  = require('../lib/config')

describe 'sinos-river-level-twitter', ->
  describe '#search', ->
    beforeEach ->
      @stub = sinon.stub Twitter::, 'get'

    afterEach ->
      @stub.restore()

    it 'is a function', ->
      expect(sinos.search).to.be.instanceof Function

    it 'calls twitter search', ->
      sinos.search {query: 'foo-bar'}, ->
      sinon.assert.calledWith(@stub, 'search/tweets', {q: 'foo-bar'})

    it 'pass a stream to callback', (done) ->
      sinos.search {query: 'foo-bar'}, (stream) ->
        expect(stream).to.be.instanceof Stream
        done()

    it 'updates config key from options', ->
      query = 'foo-bar'; key = 'abcd'; secret = '1234'
      sinos.search {query, key, secret}, ->
      expect(config).to.have.property 'TWITTER_CONSUMER_KEY', 'abcd'

    it 'updates config secret from options', ->
      query = 'foo-bar'; key = 'abcd'; secret = '1234'
      sinos.search {query, key, secret}, ->
      expect(config).to.have.property 'TWITTER_CONSUMER_SECRET', '1234'
