ReturnValue = require 'nanocyte-component-return-value'


class Trigger extends ReturnValue
  onEnvelope: (envelope) =>
    {message,config} = envelope

    return payload: "" if config?.payloadType == 'blank'

    message = config.payload
    message = Date.now() if config?.payloadType == 'timestamp'

    payload: message

module.exports = Trigger
