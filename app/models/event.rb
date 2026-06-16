class Event < ApplicationRecord

  belongs_to :organizer, class_name: "User", optional: true

  belongs_to :category
  belongs_to :venue

  has_many :registrations
  has_many :users, through: :registrations, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_rich_text :description

  before_create :set_available_capacity
  before_create :set_published_status

  enum :lifecycle_stage, {
    draft: 0,
    published: 1,
    ongoing: 2,
    completed: 3,
    cancelled: 4
  }

  validates :title, :start_date, :end_date, :maximum_capacity, presence: true

  validates :maximum_capacity, numericality: { greater_than: 0 }


  validate :end_date_after_start
  validate :capacity_consistency



  def full?
    available_capacity <= 0
  end

  def end_date_after_start
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after start date")
    end
  end

  def capacity_consistency
    if available_capacity.present? && maximum_capacity.present? &&
       available_capacity > maximum_capacity
      errors.add(:available_capacity, "cannot exceed maximum capacity")
    end
  end

  def set_published_status
    self.lifecycle_stage = :published
  end

  def set_available_capacity
    self.available_capacity = 0
  end
end