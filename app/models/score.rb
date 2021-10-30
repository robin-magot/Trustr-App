class Score < ApplicationRecord
  belongs_to :indicator
  belongs_to :product
end