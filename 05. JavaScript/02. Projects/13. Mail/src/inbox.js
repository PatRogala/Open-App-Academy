const MessageStore = require('./message_store.js');

const Inbox = {
  render: () => {
    let container = document.createElement('ul');
    const messages = MessageStore.getInboxMessages();
    container.className = 'messages';
    messages.forEach((message) => {
      const node = Inbox.renderMessage(message);
      container.appendChild(node);
    });
    return container;
  },

  renderMessage: function(message) {
    let node = document.createElement('li');
    node.className = 'message';
    node.innerHTML = `
      <span class="from">${message.from}</span>
      <span class="subject">${message.subject}</span>
      <span class="body">${message.body}</span>
    `;
    return node;
  }
}

module.exports = Inbox;
