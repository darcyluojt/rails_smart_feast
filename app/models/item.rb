class Item < ApplicationRecord
  belongs_to :basket
  belongs_to :ingredient
end
