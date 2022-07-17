const FollowToggle = require('./follow_toggle');
const UsersSearch = require('./users_search');
const TweetCompose = require('./tweet_compose');
const InfiniteTweets = require('./infinite_tweets');

$(() => {
  $(".follow-toggle").each((_, el) => {
    new FollowToggle(el);
  });

  $("nav.users-search").each((_, el) => {
    new UsersSearch(el);
  });

  $(".tweet-compose").each((_, el) => {
    new TweetCompose(el);
  });

  $(".infinite-tweets").each((_, el) => {
    new InfiniteTweets(el);
  });
});
