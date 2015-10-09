ReturnValue = require 'nanocyte-component-return-value'


class Trigger extends ReturnValue
  onEnvelope: (envelope) =>
    {config} = envelope

    return "" if config?.payloadType == 'none'
    return Date.now() if config?.payloadType == 'date'

    config.payload

module.exports = Trigger
