class Vehicle < ApplicationRecord
  belongs_to :user
  has_many :zones, dependent: :destroy
  has_many :cities, through: :zones
end
