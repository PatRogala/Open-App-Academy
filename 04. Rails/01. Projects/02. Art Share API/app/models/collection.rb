class Collection < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :artwork_collections
  has_many :artworks,
           through: :artwork_collections,
           source: :artwork
end
