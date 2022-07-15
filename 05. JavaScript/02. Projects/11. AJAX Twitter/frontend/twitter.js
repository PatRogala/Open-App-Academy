const FollowToggle = require('./follow_toggle');

$(() => {
  $(".follow-toggle").each((_, el) => {
    new FollowToggle(el);
  });
});
