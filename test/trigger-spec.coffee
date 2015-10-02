ReturnValue = require 'nanocyte-component-return-value'
Trigger = require '../src/trigger'

describe 'Trigger', ->
  beforeEach ->
    @sut = new Trigger

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when it receives an envelope with payloadType date', ->
      it 'should return the timestamp', ->
        envelope =
          config:
            payloadType: 'date'
          message:
            some: 'data'

        expect(@sut.onEnvelope envelope).to.deep.equal Date.now()

    describe 'when it receives an envelope with payloadType string', ->
      it 'should return the timestamp', ->
        envelope =
          config:
            payloadType: 'string'
            payload: 'cats'

        expect(@sut.onEnvelope envelope).to.deep.equal 'cats'

    describe 'when it receives an envelope with payloadType string', ->
      it 'should return the timestamp', ->
        envelope =
          config:
            payloadType: 'none'
            payload: 'kittenz'

        expect(@sut.onEnvelope envelope).to.deep.equal ''
