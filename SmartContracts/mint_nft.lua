-- define the metadata for the NFT

-- NFT Name
local tokenName = "My NFT"

-- NFT Ticker/Id
local tokenId = "nft123"

-- Total Amount
local tokenAmount = 1

-- NFT description
local description = "This is my NFT"

-- official NFT website
local websiteUrl = "https://mynft.com"

-- NFT image
local imageUrl = "https://mynft.com/image.png"

-- ACUTAL NFT MEDIA
local mediaUrl = "https://mynft.com/media.mp4"

-- TIMESTAMP
local timestamp = os.time()

-- define the royalty options for the NFT

-- Amount of royalty usually 5 to 20, unless music.
local royaltyPercentage = 5

-- Address to send royalties
local royaltyRecipient = "recipient-address"

-- create the NFT object
local nft = {
  name = tokenName,
  id = tokenId,
  amount = tokenAmount,
  description = description,
  websiteUrl = websiteUrl,
  imageUrl = imageUrl,
  mediaUrl = mediaUrl,
  timestamp = timestamp,
  royalty = {
    percentage = royaltyPercentage,
    recipient = royaltyRecipient
  }
}

-- add the NFT to the blockchain
blockchain.addNFT(nft)

