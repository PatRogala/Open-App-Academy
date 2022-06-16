User.delete_all
Goal.delete_all
Comment.delete_all
Cheer.delete_all

10.times do 
  User.create!(
    username: Faker::Internet.username,
    password: Faker::Internet.password(min_length: 6, max_length:  12)
  )
end

User.all.each do |u|
  2.times do
    g = u.goals.create!(title: "read #{Faker::Book.title}")
    g.comments.create!(author_id: User.all.sample.id, body: Faker::Company.buzzword + " goal!")
    g.cheers.create!(giver_id: User.all.sample.id)
  end
end