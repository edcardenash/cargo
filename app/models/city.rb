class City < ApplicationRecord
  belongs_to :region
  validates :name, presence: true, uniqueness: true
  has_many :users
end
