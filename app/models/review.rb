class Review < ApplicationRecord
  belongs_to :quote
  belongs_to :user
  belongs_to :vehicle

  #validates :comment, presence: true, length: { minimum: 10 }
  #validates :rating, presence: true,  numerically: true, length: { in: 0..5 }
end
