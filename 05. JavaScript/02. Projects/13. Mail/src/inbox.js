const MessageStore = require('./message_store.js');

const Inbox = {
  render: () => {
    let container = document.createElement('ul');
    const messages = MessageStore.getInboxMessages();
    container.className = 'messages';
    container.innerHTML = 'An Inbox Message';
    return container;
  }
}

module.exports = Inbox;
