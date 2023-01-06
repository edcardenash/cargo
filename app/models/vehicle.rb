class Vehicle < ApplicationRecord
  belongs_to :user

  validates :address, :type, :capacity, presence: true
end
