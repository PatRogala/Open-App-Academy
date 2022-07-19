const MessageStore = require('./message_store.js');

const Sent = {
  render: () => {
    let container = document.createElement('ul');
    const messages = MessageStore.getSentMessages();
    container.className = 'messages';
    messages.forEach((message) => {
      const node = Sent.renderMessage(message);
      container.appendChild(node);
    });
    return container;
  },

  renderMessage: function(message) {
    let node = document.createElement('li');
    node.className = 'message';
    node.innerHTML = `
      <span class="to">${message.to}</span>
      <span class="subject">${message.subject}</span>
      <span class="body">${message.body}</span>
    `;
    return node;
  }
}

module.exports = Sent;
