class Vehicle < ApplicationRecord
  belongs_to :user
  has_many :cities, through: :zones
end
