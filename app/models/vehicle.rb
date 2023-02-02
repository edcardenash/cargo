class Vehicle < ApplicationRecord
  attr_accessor :regions

  include PgSearch::Model
  pg_search_scope :global_search, against: [:city_id.to_s, :alias],
                                  associated_against: { city: [:name] },
                                  using: { tsearch: { prefix: true } }

  belongs_to :user
  belongs_to :city

  has_many :reviews
  has_many :quotes

  has_one_attached :photo
end
