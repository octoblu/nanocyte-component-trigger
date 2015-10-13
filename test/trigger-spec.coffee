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
            topic: 'button'
            some: 'data'

        expect(@sut.onEnvelope envelope).to.deep.equal Date.now()

    describe 'when it receives an envelope with payloadType string', ->
      it 'should return the timestamp', ->
        envelope =
          config:
            payloadType: 'string'
            payload: 'cats'
          message:
            topic: 'button'

        expect(@sut.onEnvelope envelope).to.deep.equal 'cats'

    describe 'when it receives an envelope with payloadType string', ->
      it 'should return the timestamp', ->
        envelope =
          config:
            payloadType: 'none'
            payload: 'kittenz'
          message:
            topic: 'button'

        expect(@sut.onEnvelope envelope).to.deep.equal ''

    describe 'when it receives an envelope with message topic of NOT BUTTON', ->
      it 'should return the timestamp', ->
        envelope =
          config:
            payloadType: 'date'
          message:
            some: 'data'
            topic: 'not a button'
            payload:
              radiation: 'poisoning'

        expect(@sut.onEnvelope envelope).to.deep.equal {
          some: 'data'
          topic: 'not a button'
          payload:
            radiation: 'poisoning'
        }
