class Visit < ApplicationRecord
  belongs_to :visitor, class_name: 'User', foreign_key: 'user_id'
  belongs_to :visited_url, class_name: 'ShortenedUrl', foreign_key: 'short_url_id'

  def self.record_visit!(user, shortened_url)
    create!(user_id: user.id, short_url_id: shortened_url.id)
  end
end
