class Freight < ApplicationRecord
  belongs_to :user

  geocoded_by :address

  has_one_attached :photo
end
