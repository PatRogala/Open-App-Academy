const APIUtil = {
  followUser: id => {
    return $.ajax({
      method: "POST",
      url: `/users/${id}/follow`,
      dataType: "json"
    });
  },

  unfollowUser: id => {
    return $.ajax({
      method: "DELETE",
      url: `/users/${id}/follow`,
      dataType: "json"
    });
  },

  searchUsers: queryVal => {
    return $.ajax({
      method: "GET",
      url: "/users/search",
      data: { query: queryVal },
      dataType: "json"
    });
  },

  createTweet: data => {
    return $.ajax({
      method: "POST",
      url: "/tweets",
      data: { tweet: data },
      dataType: "json"
    });
  },

  fetchTweets: data => {
    return $.ajax({
      method: "GET",
      url: "/feed",
      dataType: "json",
      data
    });
  }
};

module.exports = APIUtil;
