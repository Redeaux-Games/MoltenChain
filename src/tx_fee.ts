// Transaction Fee Module

import { MoltenChain } from 'moltenchain'

// Define the fee amount in MAGMA
const FEE_AMOUNT = 0.001

// Define the function to apply the transaction fee
async function applyTransactionFee(moltenchain: MoltenChain, tx: any) {
  // Check if the transaction value is greater than the fee amount
  if (tx.value < FEE_AMOUNT) {
    // Reject the transaction if the value is not sufficient
    throw new Error('Insufficient fee')
  }

  // Deduct the fee from the transaction value
  const value = tx.value - FEE_AMOUNT

  // Send the remaining value to the destination address
  return moltenchain.sendTransaction(tx.from, tx.to, value, tx.data)
}

export { applyTransactionFee }
