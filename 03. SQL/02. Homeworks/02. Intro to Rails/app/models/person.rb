class Person < ApplicationRecord
  validates :name, :house_id, presence: true

  belongs_to :house
end
