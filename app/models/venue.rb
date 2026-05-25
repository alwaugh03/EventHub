class Venue < ApplicationRecord
  has_many :events


  validates :name, :address, :capacity, presence: true
  validates :capacity, numericality: { greater_than: 0 }
end