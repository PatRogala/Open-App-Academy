class Question < ApplicationRecord
  validates :text, presence: true

  belongs_to :poll

  has_many :answer_choices, dependent: :destroy
  has_many :responses, through: :answer_choices, source: :responses

  def results
    acs = AnswerChoice.find_by_sql(<<-SQL, id)
      SELECT answer_choices.text, COUNT(responses.id) AS num_responses
      FROM answer_choices
      LEFT OUTER JOIN responses ON answer_choices.id = responses.answer_choice_id
      WHERE answer_choices.question_id = ?
      GROUP BY answer_choices.id
    SQL

    acs.each_with_object({}) do |ac, results|
      results[ac.text] = ac.num_responses
    end
  end
end
