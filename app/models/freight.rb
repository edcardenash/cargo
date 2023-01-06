class Freight < ApplicationRecord
  belongs_to :user

  validates :boolean_field_name, inclusion: { in: [true, false] }
end
