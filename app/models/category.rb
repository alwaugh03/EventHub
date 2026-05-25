class Category < ApplicationRecord
  has_many :events

  has_rich_text :description

  validates :name, presence: true, uniqueness: true
end