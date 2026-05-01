class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum :status, {
    confirmed: 0,
    waiting: 1,
    cancelled: 2
  }

  validates :user_id, uniqueness: { scope: :event_id }

  validate :event_not_started
  validate :assign_status_based_on_capacity

  before_create :set_status

  private

  def event_not_started
    if event.start_date <= Time.current
      errors.add(:base, "Event already started")
    end
  end

  def set_status
    if event.available_capacity > 0
      self.status = :confirmed
      event.available_capacity -= 1
    else
      self.status = :waiting
    end
  end
end