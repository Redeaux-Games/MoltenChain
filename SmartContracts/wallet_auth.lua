-- constants
local USER_ADDRESS_LENGTH = 20  -- length of an Ethereum address in bytes

-- variables
local authorizedUsers = {}  -- set of authorized user addresses

-- functions
function addAuthorizedUser(userAddress)
  -- check that the user address is of the correct length
  assert(#userAddress == USER_ADDRESS_LENGTH, "Invalid user address")

  -- add the user to the set of authorized users
  authorizedUsers[userAddress] = true
end

function isAuthorized(userAddress)
  -- check that the user address is of the correct length
  assert(#userAddress == USER_ADDRESS_LENGTH, "Invalid user address")

  -- return whether the user is authorized
  return authorizedUsers[userAddress] == true
end
