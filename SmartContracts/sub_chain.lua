-- constants
local TOKEN_ID_LENGTH = 32  -- length of the token id in bytes
local BLOCK_INTERVAL = 300  -- block interval in seconds

-- variables
local tokenIdToSubChain = {}  -- mapping from token id to sub-chain
local subChainToTokenIds = {}  -- mapping from sub-chain to list of token ids
local subChainToBlockNumber = {}  -- mapping from sub-chain to current block number
local subChainToTimestamp = {}  -- mapping from sub-chain to current timestamp
local subChainToTransactions = {}  -- mapping from sub-chain to list of transactions

-- functions
function createSubChain(tokenId)
  -- check that the token id is of the correct length
  assert(#tokenId == TOKEN_ID_LENGTH, "Invalid token id")

  -- check that the sub-chain does not already exist
  assert(tokenIdToSubChain[tokenId] == nil, "Sub-chain already exists")

  -- create a new sub-chain
  local subChain = {
    tokenId = tokenId,
    blockNumber = 0,
    timestamp = os.time(),
    transactions = {},
  }

  -- update the mappings
  tokenIdToSubChain[tokenId] = subChain
  subChainToTokenIds[subChain] = {tokenId}
  subChainToBlockNumber[subChain] = 0
  subChainToTimestamp[subChain] = os.time()
  subChainToTransactions[subChain] = {}

  -- return the created sub-chain
  return subChain
end

function addTransaction(subChain, transaction)
  -- check that the sub-chain exists
  assert(subChainToTokenIds[subChain] ~= nil, "Invalid sub-chain")

  -- check that the block interval has passed
  local currentTimestamp = os.time()
  assert(currentTimestamp - subChainToTimestamp[subChain] >= BLOCK_INTERVAL, "Block interval not reached")

  -- add the transaction to the sub-chain
  subChainToTransactions[subChain][#subChainToTransactions[subChain] + 1] = transaction

  -- update the block number and timestamp
  subChainToBlockNumber[subChain] = subChainToBlockNumber[subChain] + 1
  subChainToTimestamp[subChain] = currentTimestamp
end

function getSubChain(tokenId)
  -- check that the token id is of the correct length
  assert(#tokenId == TOKEN_ID_LENGTH, "Invalid token id")

  -- return the sub-chain for the given token id
  return tokenIdToSubChain[tokenId]
end

function get
