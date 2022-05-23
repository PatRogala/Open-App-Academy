class ArtworkShare < ApplicationRecord
  validates :artwork_id, :viewer_id, presence: true
  validates :artwork_id, uniqueness: { scope: :viewer_id }

  belongs_to :artwork

  belongs_to :viewer,
             class_name: 'User',
             foreign_key: :viewer_id
end
