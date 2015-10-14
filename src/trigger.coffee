ReturnValue = require 'nanocyte-component-return-value'

class Trigger extends ReturnValue
  onEnvelope: (envelope) =>
    {config,message} = envelope

    return message unless message.topic == 'button'
    return payload: "" if config?.payloadType == 'none'
    return payload: Date.now() if config?.payloadType == 'date'

    payload: config.payload

module.exports = Trigger
