class Car < ApplicationRecord
  include PgSearch
  mount_uploader :photo, PhotoUploader
  belongs_to :user_as_owner, class_name: "User", foreign_key: 'user_id'
  has_many :bookings
  has_many :users_as_renter, through: :bookings, source: :user

  pg_search_scope :full_text_search,
    against: [ :brand, :description],
    using: {
      tsearch: { prefix: true }
    }

end
