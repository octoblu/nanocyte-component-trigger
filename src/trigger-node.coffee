class TriggerNode
  constructor: (@config, @data) ->
  onMessage:(message, callback=->)=>
    sendMsg =
      message: message

    if @config.payloadType == 'date'
      sendMsg.message = Date.now()

    callback null, sendMsg

module.exports = TriggerNode
