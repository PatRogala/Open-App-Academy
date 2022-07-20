const MessageStore = require('./message_store.js');

const Compose = {
  render: () => {
    let container = document.createElement('div');
    container.className = 'new_message';
    container.innerHTML = Compose.renderForm();
    container.addEventListener('change', (event) => {
      let target = event.target;
      MessageStore.updateDraftField(target.name, target.value);
    });
    container.addEventListener('submit', (event) => {
      event.preventDefault();
      MessageStore.sendDraft();
      window.location.hash = 'inbox';
    });
    return container;
  },

  renderForm: () => {
    let messageDraft = MessageStore.getMessageDraft();
    let message = `
      <p class="new-message-header">New Message</p>
      <form class="compose-form">
        <input type="text" name="to" placeholder="Recipient" value="${messageDraft.to}">
        <input type="text" name="subject" placeholder="Subject" value="${messageDraft.subject}">
        <textarea name="body" rows="20">${messageDraft.body}</textarea>
        <button type="submit" class="btn btn-primary submit-message">Send</button>
      </form>
    `
    return message;
  }
}

module.exports = Compose;
