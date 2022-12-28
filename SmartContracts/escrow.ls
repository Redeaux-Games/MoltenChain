-- Define the escrow contract
local escrow = {}

-- Initialize the contract with the buyer, seller, and arbitrator addresses
function escrow:new(buyer, seller, arbitrator)
  local o = {
    buyer = buyer,
    seller = seller,
    arbitrator = arbitrator
  }
  setmetatable(o, self)
  self.__index = self
  return o
end

-- Deposit funds into the escrow
function escrow:deposit(amount)
  -- Check that the sender is the buyer
  if msg.sender ~= self.buyer then
    error("Only the buyer can deposit funds into the escrow")
  end

  -- Check that the amount is greater than zero
  if amount <= 0 then
    error("The deposit amount must be greater than zero")
  end

  -- Check that the buyer has sufficient funds
  if balance < amount then
    error("The buyer does not have sufficient funds")
  end

  -- Update the balance
  self.balance = self.balance + amount

  -- Emit a deposit event
  log({
    event = "Deposit",
    buyer = msg.sender,
    seller = self.seller,
    arbitrator = self.arbitrator,
    amount = amount
  })
end

-- Release the funds to the seller
function escrow:release(amount)
  -- Check that the sender is the arbitrator
  if msg.sender ~= self.arbitrator then
    error("Only the arbitrator can release the funds")
  end

  -- Check that the amount is greater than zero
  if amount <= 0 then
    error("The release amount must be greater than zero")
  end

  -- Check that the amount is not greater than the balance
  if amount > self.balance then
    error("The release amount cannot be greater than the balance")
  end

  -- Send the funds to the seller
  transfer(self.seller, amount)

  -- Update the balance
  self.balance = self.balance - amount

  -- Emit a release event
  log({
    event = "Release",
    buyer = self.buyer,
    seller = self.seller,
    arbitrator = msg.sender,
    amount = amount
  })
end

-- Refund the funds to the buyer
function escrow:refund(amount)
  -- Check that the sender is the arbitrator
  if msg.sender ~= self.arbitrator then
    error("Only the arbitrator can refund the funds")
  end

  -- Check that the amount is greater than zero
  if amount <= 0 then
    error("The refund amount must be greater than zero")
  end

  -- Check that the amount is not greater than the balance
  if amount > self.balance then
    error("The refund amount cannot be greater than the balance")
  end

  -- Send the funds to the buyer
  transfer(self.buyer, amount)

  -- Update the balance
  self.balance = self.balance - amount

  -- Emit a refund event
  log({
    event = "Refund",
    buyer = self.buyer,
    seller = self.seller,
    arbitrator = msg.sender,
    amount
