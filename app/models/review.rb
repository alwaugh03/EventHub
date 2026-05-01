class Review < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :rating, inclusion: { in: 1..5 }
  validates :comment, presence: true

  validate :user_attended_event

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :comment, presence: true

  validate :event_must_be_completed

  def event_must_be_completed
    unless event.completed?
      errors.add(:base, "Event must be completed to leave a review")
    end
  end
end

