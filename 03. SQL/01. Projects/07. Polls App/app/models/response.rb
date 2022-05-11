class Response < ApplicationRecord
  belongs_to :answer_choice
  belongs_to :respondent, class_name: 'User', foreign_key: 'user_id'

  has_one :question, through: :answer_choice, source: :question

  validate :not_duplicate_response
  validate :cant_respond_to_own_poll

  def sibling_responses
    question.responses.where.not(id:)
  end

  def respondent_already_answered?
    sibling_responses.exists?(user_id:)
  end

  def not_duplicate_response
    errors[:base] << 'Respondent has already answered this question' if respondent_already_answered?
  end

  def cant_respond_to_own_poll
    errors[:base] << 'Respondent cant answer to his own poll' if question.poll.author_id == user_id
  end
end
