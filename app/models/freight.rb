class Freight < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo

  def destiny_address(destiny)
    Geocoder.search(destiny)
  end
end
