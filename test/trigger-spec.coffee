{PassThrough} = require 'stream'
Trigger = require '../src/trigger'

describe 'OctoModel', ->
  it 'should exist', ->
    expect(Trigger).to.exist

  describe 'when constructed', ->
    beforeEach ->
      @sut = new Trigger

    it 'should exist', ->
      expect(@sut).to.exist

  describe 'when we pipe the envelopeStream and pipe it to the sut', ->
    beforeEach (done) ->
      @sut = new Trigger
      @envelopeStream = new PassThrough objectMode: true
      @envelopeStream.pipe @sut
      @envelopeStream.write message: {some: 'data'}, done

    it 'should have the message waiting in the stream', ->
      expect(@sut.read()).to.deep.equal some: 'data'

  describe 'when we pipe the envelopeStream and the config with payloadType date', ->
    beforeEach (done) ->
      envelope =
        config:
          payloadType: 'date'
        message:
          some: 'data'

      @sut = new Trigger
      @envelopeStream = new PassThrough objectMode: true
      @envelopeStream.pipe @sut
      @envelopeStream.write envelope, done

    it 'should have the message waiting in the stream', ->
      expect(@sut.read()).to.be.closeTo Date.now(), 100
