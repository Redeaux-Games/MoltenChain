-- Instant Payment Notification
-- import the necessary libraries
local moltenchain = require('moltenchain')

-- define the contract constants
local NOTIFICATION_ID_PREFIX = 'notification:'
local NOTIFICATION_ID_PATTERN = '^' .. NOTIFICATION_ID_PREFIX .. '[a-z0-9]+$'

-- define the contract functions

-- function to send a transaction notification
function sendTransactionNotification(to, transaction)
  -- check the input parameters
  assert(to, 'missing to address')
  assert(transaction, 'missing transaction details')

  -- generate a unique notification id
  local notificationId = NOTIFICATION_ID_PREFIX .. moltenchain.random()

  -- store the notification in the contract state
  moltenchain.setState(notificationId, {
    type = 'transaction',
    data = transaction,
  })

  -- send the notification to the recipient
  moltenchain.send(to, notificationId)
end

-- function to retrieve a transaction notification
function getTransactionNotification(notificationId)
  -- check the input parameter
  assert(notificationId, 'missing notification id')
  assert(string.match(notificationId, NOTIFICATION_ID_PATTERN), 'invalid notification id')

  -- retrieve the notification from the contract state
  local notification = moltenchain.getState(notificationId)
  if not notification then
    return nil
  end

  -- check that the caller is the recipient of the notification
  if moltenchain.caller() ~= moltenchain.sender() then
    return nil
  end

  -- return the notification
  return notification
end
