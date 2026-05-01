class Event < ApplicationRecord
  belongs_to :organizer, class_name: "User"

  has_many :registrations
  has_many :users, through: :registrations
  has_many :reviews

  enum :lifecycle_stage, {
    draft: 0,
    published: 1,
    ongoing: 2,
    completed: 3,
    cancelled: 4
  }

  validates :title, :start_date, :end_date, :maximum_capacity, presence: true

  validate :end_date_after_start

  def end_date_after_start
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after start date")
    end
  end
end