require 'sqlite3'
require 'singleton'

# Class that manages the database for the questions
class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('./questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end
