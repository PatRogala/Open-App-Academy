class Question < ApplicationRecord
  validates :text, presence: true

  belongs_to :poll

  has_many :answer_choices, dependent: :destroy
end
