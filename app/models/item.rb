class Item < ApplicationRecord
  belongs_to :basket
  belongs_to :ingredient
  validates :ingredient_id, uniqueness: { scope: :basket_id }
end
