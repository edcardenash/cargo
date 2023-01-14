class Region < ApplicationRecord
  belongs_to :country

  validates :name, presence: true

  has_many :cities, dependent: :destroy

end
