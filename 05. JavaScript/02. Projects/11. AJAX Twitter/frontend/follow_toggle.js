const APIUtil = require('./api_util');

class FollowToggle {
  constructor(el, options) {
    this.$el = $(el);
    this.userId = this.$el.data("user-id") || options.userId;
    this.followState = this.$el.data("initial-follow-state") || options.followState;
    this.render();
    this.$el.on("click", this.handleClick.bind(this));
  }

  render() {
    this.$el.prop('disabled', this.followState === "following" || this.followState === "unfollowing");

    if (this.followState === "unfollowed") {
      this.$el.text("Follow!");
    } else if (this.followState === "followed") {
      this.$el.text("Unfollow!");
    } else if (this.followState === "following") {
      this.$el.text("Following...");
    } else if (this.followState === "unfollowing") {
      this.$el.text("Unfollowing...");
    }
  }

  handleClick(e) {
    e.preventDefault();
    if (this.followState === "unfollowed") {
      this.followState = "following";
      this.render();
      APIUtil.followUser(this.userId).done(() => {
      this.followState = "followed";
      this.render();
    });
    } else if (this.followState === "followed") {
      this.followState = "unfollowing";
      this.render();
      APIUtil.unfollowUser(this.userId).done(() => {
      this.followState = "unfollowed";
      this.render();
    });
    }
  }
}

module.exports = FollowToggle;
