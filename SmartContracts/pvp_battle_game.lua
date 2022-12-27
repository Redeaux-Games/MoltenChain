-- player vs player battle arena game smart contract for MoltenChain

-- contract state
state = {
  -- map of battle IDs to battles
  battles = {},

  -- map of user addresses to balances
  balances = {}
}

-- function to create a new battle
function create_battle(stake)
  -- check if the caller has enough balance
  if state.balances[msg.sender] >= stake then
    -- subtract the stake from the caller's balance
    state.balances[msg.sender] = state.balances[msg.sender] - stake

    -- create a new battle
    local battle = {
      id = #state.battles + 1,
      creator = msg.sender,
      stake = stake,
      player1 = msg.sender,
      player2 = nil,
      winner = nil
    }

    -- add the battle to the list of battles
    table.insert(state.battles, battle)

    -- return the battle ID
    return battle.id
  else
    -- throw an error if the caller doesn't have enough balance
    error("insufficient balance")
  end
end

-- function to join a battle
function join_battle(battle_id, stake)
  -- get the battle
  local battle = state.battles[battle_id]

  -- check if the battle exists
  if battle then
    -- check if the battle is open
    if not battle.player2 then
      -- check if the caller has enough balance
      if state.balances[msg.sender] >= stake then
        -- subtract the stake from the caller's balance
        state.balances[msg.sender] = state.balances[msg.sender] - stake

        -- set the second player
        battle.player2 = msg.s
