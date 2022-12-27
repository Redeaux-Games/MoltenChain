-- play-to-earn smart contract for MoltenChain

-- contract state
state = {
  -- map of user addresses to balances
  balances = {},

  -- game contract address
  game_contract = nil
}

-- init function
function init(game_contract_addr)
  -- set the game contract address
  state.game_contract = game_contract_addr
end

-- function to earn tokens
function earn(amount)
  -- check if the caller is the game contract
  if caller() == state.game_contract then
    -- get the user address
    local user_addr = msg.sender

    -- add the tokens to the user's balance
    state.balances[user_addr] = (state.balances[user_addr] or 0) + amount
  else
    -- throw an error if the caller is not the game contract
    error("only the game contract can call this function")
  end
end

-- function to get the balance of a user
function get_balance(user_addr)
  -- return the balance of the user
  return state.balances[user_addr] or 0
end

-- function to transfer tokens to another user
function transfer(to_addr, amount)
  -- get the user address
  local from_addr = msg.sender

  -- check if the sender has enough tokens
  if state.balances[from_addr] >= amount then
    -- subtract the tokens from the sender's balance
    state.balances[from_addr] = state.balances[from_addr] - amount

    -- add the tokens to the recipient's balance
    state.balances[to_addr] = (state.balances[to_addr] or 0) + amount
  else
    -- throw an error if the sender doesn't have enough tokens
    error("insufficient balance")
  end
end
