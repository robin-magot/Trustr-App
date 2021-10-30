class Product < ApplicationRecord
  belongs_to :user
  has_many :scores
  has_many :indicators, through: :scores

  #def general_score
    #score_count = content.valid?.count / content.count
  #end
end
