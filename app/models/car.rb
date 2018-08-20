class Car < ApplicationRecord
  belongs_to :user_as_owner, class_name: "User", foreign_key: 'user_id'
  has_many :bookings
  has_many :users_as_renter, through: :bookings, source: :user
end
