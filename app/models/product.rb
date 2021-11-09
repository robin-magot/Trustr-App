class Product < ApplicationRecord
  belongs_to :user
  has_many :scores
  has_many :indicators, through: :scores
  has_many :reviews

  def indicators_trusted_count
    indicators.select { |indicator| indicator.trusted? }.count #select sélectionne naturellement les trous / reject sélectionne tous les false
  end
end
