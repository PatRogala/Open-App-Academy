const APIUtil = require('./api_util.js');

class InfiniteTweets {
  constructor(el) {
    this.$el = $(el);
    this.$tweetsUl = $(this.$el.find("#feed"));
    this.maxCreatedAt = null;
    this.$el.on('click', '.fetch-more', this.fetchTweets.bind(this));
    this.$el.on('insert-tweet', this.insertTweets.bind(this));
  }

  fetchTweets(event) {
    event.preventDefault();

    const infiniteTweets = this;
    const data = {};
    if (this.lastCreatedAt) data.max_created_at = this.lastCreatedAt;

    APIUtil.fetchTweets(data).then((data) => {
      infiniteTweets.insertTweets(data);

      if (data.length < 20) {
        infiniteTweets.$el
          .find('.fetch-more')
          .replaceWith('<b>No more tweets!</b>');
      }

      if (data.length > 0) {
        infiniteTweets.lastCreatedAt = data[data.length - 1].created_at;
      }
    });
  }


  insertTweets(tweets) {
    this.$tweetsUl.append(
      tweets.map(tweet => {
        return `<li>${JSON.stringify(tweet)}</li>`;
      }).join('')
    );
  }
}

module.exports = InfiniteTweets;
