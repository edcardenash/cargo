class Country < ApplicationRecord

  validates :name, presence: true, uniqueness: true

  has_many :regions, dependent: :destroy

end
