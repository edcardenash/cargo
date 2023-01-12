class Vehicle < ApplicationRecord
  attr_accessor :regions

  belongs_to :user
  has_one_attached :photo
end
