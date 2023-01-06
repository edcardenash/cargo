class City < ApplicationRecord
  belongs_to :region

  validates :name, presence: true, uniqueness: true
end
