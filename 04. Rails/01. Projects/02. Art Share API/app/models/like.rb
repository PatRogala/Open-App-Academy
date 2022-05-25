class Like < ApplicationRecord
  validates :user_id, :likeable_id, :likeable_type, presence: true
  validates :likeable_id, uniqueness: { scope: %i[likeable_type user_id] }

  belongs_to :likeable, polymorphic: true
end
