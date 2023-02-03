class Payment < ApplicationRecord
  attr_accessor :card_number, :expiration_date, :ccv

  validates :name, presence: true
  validates :card_number, numericality: { only_integer: true }, allow_nil: true
  validates :expiration_date, format: { with: /\A\d{2}\/\d{2}\z/, message: "debe estar en formato MM/AA" }, allow_nil: true
  validates :ccv, numericality: { only_integer: true }, allow_nil: true
end
