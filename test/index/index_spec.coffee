Stream  = require('stream')
Twitter = require('twitter')
sinos   = require('../../index')

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
      sinon.assert.calledWith(@stub, 'search/tweets', {q: 'foo-bar', result_type: 'recent'})

    it 'pass a stream to callback', (done) ->
      sinos.search {query: 'foo-bar'}, (stream) ->
        expect(stream).to.be.instanceof Stream
        done()
