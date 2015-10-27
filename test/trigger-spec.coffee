ReturnValue = require 'nanocyte-component-return-value'
Trigger = require '../src/trigger'

describe 'Trigger', ->
  beforeEach ->
    @sut = new Trigger

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when it receives an envelope with payloadType date', ->
      it 'should return the payload containting a timestamp', ->
        envelope =
          config:
            payloadType: 'date'
          message:
            topic: 'button'
            some: 'data'

        expect(@sut.onEnvelope envelope).to.deep.equal payload: Date.now()

    describe 'when it receives an envelope with triggers-service topic', ->
      it 'should return the payload containting a timestamp', ->
        envelope =
          config:
            payloadType: 'date'
          message:
            topic: 'triggers-service'
            params:
              foo: 'bar'

        expect(@sut.onEnvelope envelope).to.deep.equal params: foo: 'bar'

    describe 'when it receives an envelope with payloadType string', ->
      it 'should return the payload containing the string', ->
        envelope =
          config:
            payloadType: 'string'
            payload: 'cats'
          message:
            topic: 'button'

        expect(@sut.onEnvelope envelope).to.deep.equal payload: 'cats'

    describe 'when it receives an envelope with payloadType none', ->
      it 'should return the payload containing an empty string', ->
        envelope =
          config:
            payloadType: 'none'
            payload: 'kittenz'
          message:
            topic: 'button'

        expect(@sut.onEnvelope envelope).to.deep.equal payload: ''

    describe 'when it receives an envelope with message topic of NOT BUTTON', ->
      it 'should return the message', ->
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
