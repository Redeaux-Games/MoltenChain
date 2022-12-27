# MoltenChain
MoltenChain is a Proof-of-Stake blockchain for the native MAGMA cryptocurrency.

MoltenChain is a blockchain that has been specifically written for the MAGMA cryptocurrency network and its ecosystem.

MoltenChain has been completely written in TypeScript and features smart contract deployment written in Lua.
We have included a security feature to sanitize the Lua code deployed to the MoltenChain network.


## Example Smart Contract

```
-- define the contract variables
local stakedNFTs = {}

-- define the contract function to stake NFTs
function stakeNFTs(nftId, amount)
  -- check that the caller has the specified amount of NFTs
  if blockchain.getNFTBalance(blockchain.caller(), nftId) < amount then
    error("The caller does not have enough NFTs")
  end

  -- transfer the NFTs to the contract
  blockchain.transferNFT(contractAddress, amount, nftId)

  -- add the staked NFTs to the list
  if stakedNFTs[nftId] == nil then
    stakedNFTs[nftId] = {}
  end
  stakedNFTs[nftId][blockchain.caller()] = {
    amount = amount,
    startTime = blockchain.timestamp()
  }
end
```
