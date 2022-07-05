class Cat < ApplicationRecord
  validates :name, uniqueness: true
  has_many :toys, as: :toyable
end
