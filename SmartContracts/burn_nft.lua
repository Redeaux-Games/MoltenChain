-- define the contract function
function burnNFT(nftId)
  -- get the NFT from the blockchain
  local nft = blockchain.getNFT(nftId)

  -- check that the caller is the owner of the NFT
  if blockchain.caller() == nft.owner then
    -- reduce the total supply of the NFT by 1
    nft.totalSupply = nft.totalSupply - 1
    -- remove the NFT from the blockchain
    blockchain.removeNFT(nftId)
  else
    -- the caller is not the owner of the NFT, throw an error
    error("Only the owner of the NFT can burn it")
  end
end
