const ApiUtil = require('./api_util');
const FollowToggle = require('./follow_toggle');

class UsersSearch {
  constructor(el) {
    this.$el = $(el);
    this.$input = this.$el.find("input");
    this.$ul = this.$el.find("ul.users");
    this.$input.on("input", this.handleInput.bind(this));
  }

  handleInput(e) {
    const queryVal = this.$input.val();
    ApiUtil.searchUsers(queryVal).then(users => {
      this.renderResults(users);
    });
  }

  renderResults(users) {
    this.$ul.empty();
    users.forEach(user => {
      let $a = $('<a></a>');
      $a.text(`@${user.username}`);
      $a.attr('href', `/users/${user.id}`);

      const $followToggle = $('<button></button>');
      new FollowToggle($followToggle, {
        userId: user.id,
        followState: user.followed ? 'followed' : 'unfollowed'
      });

      const $li = $('<li></li>');
      $li.append($a);
      $li.append($followToggle);

      this.$ul.append($li);
    });
  }
}

module.exports = UsersSearch;
