# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
u1 = User.create(username: 'Patryk')

p1 = Poll.create(title: 'Favorite Color', author_id: u1.id)

q1 = Question.create(text: 'What is your favorite color?', poll_id: p1.id)

a1 = AnswerChoice.create(text: 'Red', question_id: q1.id)
AnswerChoice.create(text: 'Blue', question_id: q1.id)
AnswerChoice.create(text: 'Green', question_id: q1.id)
AnswerChoice.create(text: 'Yellow', question_id: q1.id)

Response.create(user_id: u1.id, answer_choice_id: a1.id)
