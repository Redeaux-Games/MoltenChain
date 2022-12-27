-- define the metadata for the token
-- name of the token
local tokenName = "My Token"

-- tokenId is also the ticker
local tokenId = "t123"

-- tokenAmount is the total token supply
local tokenAmount = 10000000

-- number of zeros after the decimal
local decimals = 7

-- Description of the token
local description = "This is my token"

-- token's official website
local websiteUrl = "https://mytoken.com"

-- Token Logo, should be a png.
local imageUrl = "https://mytoken.com/logo.png"

-- create the token object

local token = {
  name = tokenName,
  id = tokenId,
  amount = tokenAmount,
  decimals = decimals,
  description = description,
  websiteUrl = websiteUrl,
  imageUrl = imageUrl
}

-- add the token to the blockchain

blockchain.addToken(token)
