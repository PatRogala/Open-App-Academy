class ArtworkCollection < ApplicationRecord
  belongs_to :collection
  belongs_to :artwork
end
