class Tagging < ApplicationRecord
  validates :tag_topic_id, uniqueness: { scope: :shortened_url_id }

  belongs_to :shortened_url, class_name: 'ShortenedUrl', foreign_key: 'shortened_url_id'
  belongs_to :tag_topic, class_name: 'TagTopic', foreign_key: 'tag_topic_id'
end
