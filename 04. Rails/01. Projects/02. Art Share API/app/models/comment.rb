class Comment < ApplicationRecord
  validates :body, :user_id, :artwork_id, presence: true

  belongs_to :user
  belongs_to :artwork
  has_many :likes, as: :likeable
end
