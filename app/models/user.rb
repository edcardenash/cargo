class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :city

  has_one_attached :photo

  has_many :vehicles, dependent: :destroy
  has_many :freights, dependent: :destroy
  has_many :reviews, dependent: :destroy
  # has_many :quotes, dependent: :destroy
end
