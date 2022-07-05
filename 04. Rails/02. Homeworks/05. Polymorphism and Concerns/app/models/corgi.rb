class Corgi < ApplicationRecord
  validates :name, uniqueness: true
  include Toyable
end
