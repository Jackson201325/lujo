class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  # validates :address, presence: true
  # validates :year, presence: true
  # validates :brand, presence: true
  # validates :model, presence: true
  # validates :odometer, presence: true
  # validates :transmission, presence: true
  # validates :license_plate, presence: true
  # validates :description, presence: true
  # validates :image, presence: true
  # validates :availability, presence: true
  # validates :latitude, presence: true
  # validates :longitude, presence: true
  # validates :price_per_day, presence: true

  mount_uploader :image, PhotoUploader

  include PgSearch
  pg_search_scope :search_by_car_attributes,
    against: [ :model, :brand, :address, :transmission, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
