json.array!(@tweets) do |tweet|
  json.set!(tweet.id) do
    json.extract!(tweet, :content, :user_id)
    json.username(tweet.user.username)
    json.mentioned_users(tweet.mentioned_users.map(&:username))
  end
end
