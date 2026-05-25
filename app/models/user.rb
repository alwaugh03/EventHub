class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, foreign_key: :organizer_id

  has_many :registrations
  has_many :registered_events, through: :registrations, source: :event

  has_many :reviews

  enum :role, { regular: 0, admin: 1 }

  validates :email, presence: true, uniqueness: true
end