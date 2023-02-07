class Vehicle < ApplicationRecord
  attr_accessor :regions

  include PgSearch::Model
  pg_search_scope :global_search, against: [:city_id.to_s, :alias],
                                  associated_against: { city: [:name] },
                                  using: { tsearch: { prefix: true } }

  belongs_to :user
  belongs_to :city

  validates :license_plate, :vehicle_type, :description, :load_capacity, presence: true
  validates :alias, presence: true, uniqueness: true

  has_many :reviews, dependent: :destroy
  has_many :quotes, dependent: :destroy

  has_one_attached :photo
end
