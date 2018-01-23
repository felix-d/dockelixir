// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"
import channel from './socket'


const button = document.getElementById('send')
const messages = document.getElementById('messages')
const messageInput = document.getElementById('message')

function prependMessage(message) {
  const node = document.createElement("LI")
  const textNode = document.createTextNode(message);
  node.appendChild(textNode)
  messages.prepend(node)
}

channel.on('messages', payload => {
  while (messages.firstChild) {
    messages.removeChild(messages.firstChild);
  }
  payload.messages.forEach(message => {
    prependMessage(message)
  })
})

channel.on('message', payload => {
  prependMessage(payload.message)
})

send.addEventListener('click', () => {
  const message = messageInput.value

  messageInput.value = ''

  channel.push('add_message', { message })
})
