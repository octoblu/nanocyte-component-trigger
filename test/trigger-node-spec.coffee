TriggerNode = require '../src/trigger-node'
describe 'OctoModel', ->
  it 'should exist', ->
    expect(TriggerNode).to.exist

  describe 'when constructed', ->
    beforeEach ->
      @sut = new TriggerNode

    it 'should exist', ->
      expect(@sut).to.exist

    it 'should have an onMessage function', ->
      expect(@sut.onMessage).to.exist

  describe '->onMessage', ->
    describe 'when given a message, it calls the callback containing the message', ->
      beforeEach ->
        @config = {}
        @data = {}
        @callback = sinon.spy()
        @message =
           hi : 'how are you'
        @sendMessage =
         message : @message
        @sut = new TriggerNode(@config, @data)
        @sut.onMessage(@message, @callback)
      it 'should call the callback with the message', ->
        expect(@callback).to.have.been.calledWith(null, @sendMessage)

    describe 'when config has a payload type of date', ->
      beforeEach ->
        @config = payloadType : "date"
        @data = {}
        @callback = sinon.spy()
        @message =
           hi : 'how are you'

        @sut = new TriggerNode(@config, @data)
        @beforeDate = Date.now()
        @sut.onMessage(@message, @callback)

      it 'should call the callback with the message containing date', ->
        callArguments = @callback.args[0]
        sendMessage = callArguments[1]

        console.log sendMessage.message, @beforeDate, sendMessage.message - @beforeDate

        expect(sendMessage.message).to.exist
        expect((sendMessage.message - @beforeDate) >= 0).to.be.true
