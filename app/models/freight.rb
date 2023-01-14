class Freight < ApplicationRecord
  belongs_to :user

  geocoded_by :start_address
  geocoded_by :end_address

  has_one_attached :photo
  validates :start_address, presence: true
end
