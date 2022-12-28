class City < ApplicationRecord
  belongs_to :region
  has_many :users
  has_many :vehicles, through: :zones
end
