class Review < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :rating, presence: true, inclusion: { in: 1..5, message: "Rating must be between 1 and 5"}
  validates :comment, presence: true

  validate :user_attended_event
  validate :event_must_be_completed

  def user_attended_event
    unless event.registrations.exists?(user_id: user_id, status: :completed)
      errors.add(:base, "User must have attended the event to leave a review")
    end
  end

  def event_must_be_completed
    unless event.completed?
      errors.add(:base, "Event must be completed to leave a review")
    end
  end
end