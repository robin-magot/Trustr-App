class Product < ApplicationRecord
  belongs_to :user
  has_many :scores
  has_many :indicators, through: :scores
end
