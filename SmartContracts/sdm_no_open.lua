-- import the necessary libraries
local moltenchain = require('moltenchain')

-- define the contract constants
local MESSAGE_ID_PREFIX = 'message:'
local MESSAGE_ID_PATTERN = '^' .. MESSAGE_ID_PREFIX .. '[a-z0-9]+$'

-- define the contract functions

-- function to send a self-deleting message
function sendMessage(to, message, expiration)
  -- check the input parameters
  assert(to, 'missing to address')
  assert(message, 'missing message')
  assert(expiration, 'missing expiration')
  assert(expiration > 0, 'expiration must be greater than zero')

  -- generate a unique message id
  local messageId = MESSAGE_ID_PREFIX .. moltenchain.random()

  -- store the message in the contract state
  moltenchain.setState(messageId, {
    from = moltenchain.caller(),
    to = to,
    message = message,
    expiration = expiration,
  })
end

-- function to retrieve a self-deleting message
function getMessage(messageId)
  -- check the input parameter
  assert(messageId, 'missing message id')
  assert(string.match(messageId, MESSAGE_ID_PATTERN), 'invalid message id')

  -- retrieve the message from the contract state
  local message = moltenchain.getState(messageId)
  if not message then
    return nil
  end

  -- check that the caller is the recipient of the message
  if moltenchain.caller() ~= message.to then
    return nil
  end

  -- check that the message has not expired
  if moltenchain.blockTime() > message.expiration then
    return nil
  end

  -- delete the message from the contract state
  moltenchain.delState(messageId)

  -- return the message
  return message
end
