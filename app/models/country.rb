class Country < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
