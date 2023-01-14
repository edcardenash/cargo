class Freight < ApplicationRecord
  belongs_to :user
  geocoded_by :start_address
  has_one_attached :photo
end
