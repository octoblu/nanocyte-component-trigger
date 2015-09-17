{Transform} = require 'stream'

class TriggerNode extends Transform
  constructor: (@config, @data) ->
    super objectMode: true

  _transform: (envelope, encoding, next) =>
    {message,config} = envelope

    message = Date.now() if config?.payloadType == 'date'
    
    @push message
    @push null
    next()

module.exports = TriggerNode
