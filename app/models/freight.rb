class Freight < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many_attached :photos

  def destiny_address(destiny)
    Geocoder.search(destiny)
  end
end
