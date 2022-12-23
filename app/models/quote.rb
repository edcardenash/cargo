class Quote < ApplicationRecord
  belongs_to :vehicle
  belongs_to :freight
end
