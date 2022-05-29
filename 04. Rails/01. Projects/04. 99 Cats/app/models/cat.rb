# frozen_string_literal: true

require 'action_view'

# Represents a cat
class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  CAT_COLORS = %w[black white orange brown].freeze

  validates :birth_date, :name, :color, :sex, :description, presence: true
  validates :color, inclusion: { in: CAT_COLORS, message: 'is not a valid color' }
  validates :sex, inclusion: { in: %w[F M], message: 'is not a valid option' }

  has_many :cat_rental_requests, dependent: :destroy

  def age
    time_ago_in_words(birth_date)
  end
end
