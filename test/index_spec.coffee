sinos = require('../index')

describe 'sinos-river-level-twitter', ->
  describe '#search', ->
    it 'is a function', ->
      expect(sinos.search).to.be.instanceof Function
