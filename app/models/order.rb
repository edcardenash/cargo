class Order < ApplicationRecord
  belongs_to :user
  belongs_to :quote
  has_many :orders
end
