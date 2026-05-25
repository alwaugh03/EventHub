class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum :status, {
    confirmed: 0,
    waiting: 1,
    cancelled: 2
  }

  validates :user_id, uniqueness: { scope: :event_id, message: "already registered" }

  validate :event_not_started, on: :create

  before_create :set_status
  after_create :increase_available_capacity
  after_destroy :decrease_available_capacity

  private

  def decrease_available_capacity
    event.decrement!(:available_capacity)
  end

  def increase_available_capacity
    event.increment!(:available_capacity)
    promote_from_waitlist
  end

  def event_not_started
    if event.start_date <= Time.current
      errors.add(:base, "Event already started")
    end
  end

  def set_status
    if event.available_capacity.to_i > 0
      self.status = :confirmed
    else
      self.status = :waiting
    end
  end

  def promote_from_waitlist
    return unless event.registrations.confirmed.count < event.maximum_capacity
    
    next_waiting = event.registrations.waiting.order(:created_at, :id).first
    next_waiting&.update(status: :confirmed)
  end
end