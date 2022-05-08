class ShortenedUrl < ApplicationRecord
  validates :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true, uniqueness: true
  validate :no_spamming, :nonpremium_max

  belongs_to :submitter, class_name: 'User', foreign_key: 'user_id'
  has_many :visits, class_name: 'Visit', foreign_key: 'short_url_id', dependent: :destroy
  has_many :visitors, proc { distinct }, through: :visits, source: :visitor
  has_many :taggings, class_name: 'Tagging', foreign_key: 'shortened_url_id', dependent: :destroy
  has_many :tag_topics, through: :taggings, source: :tag_topic

  def self.random_code
    short_url = SecureRandom.urlsafe_base64(16)
    short_url = SecureRandom.urlsafe_base64(16) while ShortenedUrl.exists?(short_url:)

    short_url
  end

  def self.create_short_url(user, long_url)
    create!(user_id: user.id, long_url:, short_url: random_code)
  end

  def self.prune(minutes)
    ShortenedUrl
      .joins(:submitter)
      .joins('LEFT JOIN visits ON visits.short_url_id = shortened_urls.id')
      .where("(shortened_urls.id IN (
        SELECT shortened_urls.id
        FROM shortened_urls
        JOIN visits
        ON visits.short_url_id = shortened_urls.id
        GROUP BY shortened_urls.id
        HAVING MAX(visits.created_at) < \'#{minutes.minute.ago}\') OR
        (visits.id IS NULL and shortened_urls.created_at < \'#{minutes.minutes.ago}\'))
        AND users.premium = \'f\'")
      .destroy_all
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    visits.select(:user_id).distinct.count
  end

  def num_recent_uniques
    num_uniques.where('created_at > ?', 10.minutes.ago)
  end

  def no_spamming
    last_minute = ShortenedUrl
                  .where('created_at >= ?', 1.minute.ago)
                  .where(submitter_id:)
                  .length

    errors[:maximum] << 'of five short urls per minute' if last_minute >= 5
  end

  def nonpremium_max
    return if submitter.premium?

    errors[:maximum] << 'of five urls per non premium user' if submitter.shortened_urls.count >= 5
  end
end
