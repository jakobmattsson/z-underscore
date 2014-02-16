_ = require 'underscore'
zCore = require 'z-core'
zUnderscore = requireSource 'index'
{methods, eachMethods} = requireSource 'methods'

Z = zCore.init()
Z.mixin(zUnderscore)



describe 'z-underscore', ->

  it 'exposes the expected methods', ->
    obj = Z({})
    obj.should.have.keys methods.concat(eachMethods)

  describe 'keys', ->

    it 'returns the keys of an object', ->
      Z({ a: 1, b: 2 }).keys().should.become ["a", "b"]

    it 'returns the keys of an array', ->
      Z([1,2,3]).keys().should.become ["0", "1", "2"]

    it 'fails when executed on a string', ->
      Z("foobar").keys().should.become []

  describe 'bind', ->

    it 'binds a function to the given context', ->
      f = Z((x) -> @ + x).bind(100)
      result = f.then (fResolved) -> fResolved(2)
      result.should.become 102

  describe 'contains', ->

    it 'returns true when an array contains the given value', ->
      Z([1, 2, 3]).contains(2).should.become true

    it 'returns false when an array contains the given value', ->
      Z([1, 2, 3]).contains(4).should.become false

  describe 'omitEach', ->

    it 'returns the keys of an object', ->
      Z([{ a: 1, b: 2 }, {}, { x: 1 }]).omitEach('a').should.become [{ b: 2 }, {}, { x: 1 }]
