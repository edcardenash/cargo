class Zone < ApplicationRecord
  belongs_to :city
  belongs_to :vehicle
end
