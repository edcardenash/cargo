class Review < ApplicationRecord
  belongs_to :quote
  belongs_to :user
end
