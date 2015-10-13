ReturnValue = require 'nanocyte-component-return-value'


class Trigger extends ReturnValue
  onEnvelope: (envelope) =>
    {config,message} = envelope

    return message unless message.topic == 'button'
    return "" if config?.payloadType == 'none'
    return Date.now() if config?.payloadType == 'date'

    config.payload

module.exports = Trigger
