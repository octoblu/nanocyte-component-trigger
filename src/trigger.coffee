ReturnValue = require 'nanocyte-component-return-value'


class Trigger extends ReturnValue
  onEnvelope: (envelope) =>
    {message,config} = envelope

    return "" if config?.payloadType == 'none'

    message = config.payload
    message = Date.now() if config?.payloadType == 'date'

    message

module.exports = Trigger
