# frozen_string_literal: true

require_relative 'question_database'
require_relative 'question'
require_relative 'reply'
require_relative 'question_follow'
require_relative 'question_like'

# Class that represents users table in the database
class User
  attr_reader :id, :fname, :lname

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM users
      WHERE id = ?
      LIMIT 1
    SQL

    new(user.first)
  end

  def self.find_by_name(fname, lname)
    users = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT *
      FROM users
      WHERE fname = ? AND lname = ?
    SQL

    users.map { |user| Question.new(user) }
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def average_karma
    average_karma = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT CAST(COUNT(question_likes.id) AS FLOAT) / COUNT(DISTINCT(questions.id)) AS avg_karma
      FROM questions
      LEFT OUTER JOIN question_likes
      ON questions.id = question_likes.question_id
      WHERE questions.author_id = ?
    SQL

    average_karma.first.values.first
  end

  def save
    @id.nil? ? insert : update
  end

  def insert
    QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
      INSERT INTO users (fname, lname)
      VALUES (?, ?)
    SQL

    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
      UPDATE users
      SET fname = ?, lname = ?
      WHERE id = ?
    SQL
  end
end
