import { MoltenChain, NotificationType } from 'moltenchain'

// create an instance of the MoltenChain library
const moltenchain = new MoltenChain()

// define the notification handler function
function handleNotification(notification: NotificationType) {
  if (notification.type === 'transaction') {
    // retrieve the transaction details
    const transaction = notification.data as TransactionType

    // process the transaction
    processTransaction(transaction)
  }
}

// register the notification handler with the MoltenChain library
moltenchain.on('notification', handleNotification)

// start listening for notifications
moltenchain.listen()
