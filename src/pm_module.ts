import { MoltenChain, MessageType } from 'moltenchain'

// create an instance of the MoltenChain library
const moltenchain = new MoltenChain()

// define the message handler function
function handleMessage(message: MessageType) {
  // retrieve the message details
  const { from, data } = message

  // process the message
  processMessage(from, data)
}

// register the message handler with the MoltenChain library
moltenchain.on('message', handleMessage)

// function to send a private message
function sendPrivateMessage(to: string, message: any) {
  // send the message
  moltenchain.send(to, message)
}
