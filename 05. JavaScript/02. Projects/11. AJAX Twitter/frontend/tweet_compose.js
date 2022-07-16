const APIUtil = require('./api_util');

class TweetCompose {
  constructor(el) {
    this.$el = $(el);
    this.$tweetsUl = $(this.$el.data("tweets-ul"));
    this.$textarea = $(this.$el.find("#tweet-textarea"));
    this.$textarea.on("input", this.handleInput.bind(this));
    this.$mentionedUsersDiv = this.$el.find('.mentioned-users');
    this.$el.on("submit", this.submit.bind(this));
    this.$el.find('.add-mentioned-user').on(
      'click', this.addMentionedUser.bind(this));
    this.$el.find('.mentioned-users').on('click', '.remove-mentioned-user', this.removeMentionedUser.bind(this));
  }

  submit(event) {
    event.preventDefault();
    const serializeJSON = this.$el.serializeJSON();
    this.block();
    APIUtil.createTweet(serializeJSON).done(this.handleSuccess.bind(this));
  }

  block() {
    this.$el.find(":input").prop("disabled", true);
  }

  unblock() {
    this.$el.find(":input").prop("disabled", false);
  }

  clearInput() {
    this.$el.find("#tweet-textarea").val("");
    this.$el.find('.mentioned-users').empty();
  }

  handleSuccess(data) {
    this.clearInput();
    this.unblock();
    this.$tweetsUl.append(this.renderTweet(data));
  }

  renderTweet(tweet) {
    const $li = $("<li>");
    $li.text(JSON.stringify(tweet));
    return $li;
  }

  handleInput(event) {
    const $textarea = $(event.currentTarget);
    const $charLeft = $textarea.siblings(".char-left");
    const maxLength = 140;
    const charLeft = maxLength - $textarea.val().length;
    $charLeft.text(`${charLeft} characters left`);
  }

  newUserSelect() {
    const userOptions = window.users
      .map(user =>
        `<option value='${user.id}'>${user.username}</option>`)
      .join('');

    const html = `
      <div>
        <select name='tweet[mentioned_user_ids][]'>
          ${userOptions}
        </select>

        <button class='remove-mentioned-user'>Remove</button>
      </div>`;

    return $(html);
  }

  addMentionedUser(event) {
    event.preventDefault();

    this.$mentionedUsersDiv.append(this.newUserSelect());
  }

  removeMentionedUser(event) {
    event.preventDefault();

    $(event.currentTarget).parent().remove();
  }
}

module.exports = TweetCompose;
