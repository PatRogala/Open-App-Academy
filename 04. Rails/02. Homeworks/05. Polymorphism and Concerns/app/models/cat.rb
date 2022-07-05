class Cat < ApplicationRecord
  validates :name, uniqueness: true
  include Toyable
end
