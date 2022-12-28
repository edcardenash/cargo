class Country < ApplicationRecord
  has_many :regions, dependent: :destroy
end
