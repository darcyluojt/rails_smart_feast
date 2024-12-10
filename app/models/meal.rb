class Meal < ApplicationRecord
  belongs_to :basket
  belongs_to :recipe
end
