class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w[PENDING APPROVED DENIED] }
  validate :does_not_overlap_approved_request, on: :create

  belongs_to :cat
  belongs_to :requester, class_name: 'User', foreign_key: :user_id

  def approve!
    transaction do
      self.status = 'APPROVED'
      save!
      puts status
      overlapping_pending_requests.each(&:deny!)
    end
  end

  def deny!
    self.status = 'DENIED'
    save!
  end

  def pending?
    status == 'PENDING'
  end

  private

  def does_not_overlap_approved_request
    errors.add(:overlapping_approved_requests, "can't overlap") if overlapping_approved_requests.exists?
  end

  def overlapping_requests
    CatRentalRequest
      .where.not(id:)
      .where(cat_id:)
      .where.not(<<-SQL, start_date:, end_date:)
        (start_date > :end_date) OR
        (end_date < :start_date)
      SQL
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end

  def overlapping_pending_requests
    overlapping_requests.where(status: 'PENDING')
  end
end
