class FollowToggle {
  constructor(el) {
    this.$el = $(el);
    this.userId = this.$el.data("user-id");
    this.followState = this.$el.data("initial-follow-state");
    this.render();
    this.$el.on("click", this.handleClick.bind(this));
  }

  render() {
    if (this.followState === "unfollowed") {
      this.$el.text("Follow!");
    } else if (this.followState === "followed") {
      this.$el.text("Unfollow!");
    }
  }

  handleClick(e) {
    e.preventDefault();
    if (this.followState === "unfollowed") {
      $.ajax({
        method: "POST",
        url: `/users/${this.userId}/follow`,
        dataType: "json"
      }).done(() => {
        this.followState = "followed";
        this.render();
      });
    } else if (this.followState === "followed") {
      $.ajax({
        method: "DELETE",
        url: `/users/${this.userId}/follow`,
        dataType: "json"
      }).done(() => {
        this.followState = "unfollowed";
        this.render();
      });
    }
  }
}

module.exports = FollowToggle;
