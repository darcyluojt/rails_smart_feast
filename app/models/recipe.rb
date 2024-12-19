class Recipe < ApplicationRecord
  has_many :ingredients_recipes, dependent: :destroy
  has_many :ingredients, through: :ingredients_recipes
  has_many :meals
  belongs_to :user, optional: true

  scope :by_user, ->(user) { where(user: user) }
  scope :by_system, -> { where(user: nil) }
  scope :visible_to, ->(user) { where('user_id IS NULL OR user_id = ?', user.id) }

  validates :name, presence: true, uniqueness: true
end
