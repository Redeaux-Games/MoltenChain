-- define the contract function
function burnToken(tokenId, amount)
  -- check that the caller is the owner of the token
  if blockchain.caller() == token.owner then
    -- check that the amount to burn is valid
    if amount > 0 and amount <= token.amount then
      -- reduce the total supply of the token by the amount to be burned
      token.totalSupply = token.totalSupply - amount
      -- reduce the amount of the token owned by the caller by the amount to be burned
      token.amount = token.amount - amount
    else
      -- the amount to burn is invalid, throw an error
      error("Invalid burn amount")
    end
  else
    -- the caller is not the owner of the token, throw an error
    error("Only the owner of the token can burn it")
  end
end
