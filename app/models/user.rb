class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cars
  has_many :bookings, through: :cars
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :drivers_license, presence: true
end
