-- function to wrap tokens on MoltenChain

function wrapTokens(amount, token)
  -- verify that the amount is a positive integer
  assert(type(amount) == "number" and amount > 0 and math.floor(amount) == amount, "Invalid amount")

  -- verify that the token is valid
  assert(type(token) == "string" and #token > 0, "Invalid token")

  -- check that the user has sufficient balance of the specified token
  local balance = getTokenBalance(msg.sender, token)
  assert(balance >= amount, "Insufficient balance")

  -- wrap the tokens and update the user's balance
  wrapToken(amount, token)
  updateTokenBalance(msg.sender, token, balance - amount)

  -- return the wrapped tokens
  return amount
end
