class Item < ApplicationRecord
  belongs_to :basket
  belongs_to :ingredient

  # unique item per basket
  validates :ingredient_id, uniqueness: { scope: :basket_id }
end
