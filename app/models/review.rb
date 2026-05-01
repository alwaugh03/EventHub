class Review < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :rating, inclusion: { in: 1..5 }
  validates :comment, presence: true

  validate :user_attended_event
end