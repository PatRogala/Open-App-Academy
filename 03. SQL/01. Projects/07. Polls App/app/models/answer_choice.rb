class AnswerChoice < ApplicationRecord
  validates :text, presence: true

  belongs_to :question
  has_many :responses, dependent: :destroy
end
