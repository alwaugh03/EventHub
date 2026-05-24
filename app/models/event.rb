class Event < ApplicationRecord

  #belongs_to :user
  has_many :registrations
  has_many :users, through: :registrations
  has_many :reviews

  before_validation :normalize_category
  before_validation :normalize_venue

  enum :lifecycle_stage, {
    draft: 0,
    published: 1,
    ongoing: 2,
    completed: 3,
    cancelled: 4
  }


  enum :category, {
    tech: 0,
    music: 1,
    sports: 2
  }

  enum :venue, {
    auditorium: 0,
    main_hall: 1,
    campus_field: 2
  }

  validates :title, :start_date, :end_date, :maximum_capacity, presence: true

  validates :maximum_capacity, numericality: { greater_than: 0 }
  #validates :available_capacity, numericality: { greater_than_or_equal_to: 0 }


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

  def normalize_category
    case venue.to_s.downcase
    when "Tech"
      self.venue = :tech
    when "Music"
      self.venue = :music
    when "Sports"
      self.venue = :sports
    else
    end
  end
  
  def normalize_venue
    case venue.to_s.downcase
    when "Auditorium"
      self.venue = :auditorium
    when "Main Hall"
      self.venue = :main_hall
    when "Campus Field"
      self.venue = :campus_field
    else
    end
  end
end