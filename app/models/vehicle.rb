class Vehicle < ApplicationRecord
  attr_accessor :regions

  include PgSearch::Model
  pg_search_scope :global_search, against: [:city_id.to_s, :alias],
                                  associated_against: { city: [:name] },
                                  using: { tsearch: { prefix: true } }

  belongs_to :user
  belongs_to :city

  validates :alias, :vehicle_type, :load_capacity, :coverage, :description, presence: true
  validates :load_capacity, numericality: { greater_than_or_equal_to: 0 }
  validates :alias, uniqueness: true

  has_many :reviews, dependent: :destroy
  has_many :quotes, dependent: :destroy

  has_one_attached :photo

  def average_rating
    reviews.average(:rating).to_f
  end
end
