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
            payloadType: 'timestamp'
          message:
            some: 'data'

        expect(@sut.onEnvelope envelope).to.deep.equal payload: Date.now()

    describe 'when it receives an envelope with payloadType string', ->
      it 'should return the timestamp', ->
        envelope =
          config:
            payloadType: 'date'
            payload: 'cats'

        expect(@sut.onEnvelope envelope).to.deep.equal payload: 'cats'

    describe 'when it receives an envelope with payloadType string', ->
      it 'should return the timestamp', ->
        envelope =
          config:
            payloadType: 'blank'
            payload: 'kittenz'
            
        expect(@sut.onEnvelope envelope).to.deep.equal payload: ''
