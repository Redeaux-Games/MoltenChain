-- Transaction fee smart contract for MoltenChain

-- Constants
local FEE_AMOUNT = 0.00001 -- 0.00001 MAGMA
local DEV_WALLET = "dev.magma"

-- Function to charge transaction fee
function chargeFee(transaction)
    -- Get the sender's wallet address
    local sender = transaction.from

    -- Check if the sender has enough balance
    if sender.balance < FEE_AMOUNT then
        return false, "Insufficient funds"
    end

    -- Deduct the fee from the sender's balance
    sender.balance = sender.balance - FEE_AMOUNT

    -- Get the developer's wallet
    local devWallet = getWallet(DEV_WALLET)

    -- Add the fee to the developer's wallet
    devWallet.balance = devWallet.balance + FEE_AMOUNT

    -- Update the wallets
    updateWallet(sender)
    updateWallet(devWallet)

    -- Return true to indicate that the transaction was successful
    return true
end
