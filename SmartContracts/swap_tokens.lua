-- define the contract function
function swapTokens(tokenId1, amount1, tokenId2, amount2)
  -- get the tokens from the blockchain
  local token1 = blockchain.getToken(tokenId1)
  local token2 = blockchain.getToken(tokenId2)

  -- check that the caller owns the specified amount of token 1
  if token1.amount < amount1 then
    error("The caller does not own enough of token 1")
  end

  -- check that the recipient owns the specified amount of token 2
  if token2.amount < amount2 then
    error("The recipient does not own enough of token 2")
  end

  -- transfer the tokens
  token1.amount = token1.amount - amount1
  token2.amount = token2.amount - amount2
  token1.owner = token2.owner
  token2.owner = blockchain.caller()
end
