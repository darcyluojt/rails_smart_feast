class Profile < ApplicationRecord
  GOAL = ['Lose weight', 'Bulking', 'Gain lean muscle']
  MEAL_PLAN = ['Regular', 'High Protein', 'Low Carbs']
  GENDER = %w(Male Female)
  belongs_to :user
  has_many :profile_requirements
  has_many :requirements, through: :profile_requirements

  validates :nickname, presence: true
  validates :gender, inclusion: { in: GENDER }
  validates :fitness_goal, inclusion: { in: GOAL }
  validates :meal_plan, inclusion: { in: MEAL_PLAN }
  validates :height, inclusion: { in: 120..220 }
  validates :weight, inclusion: { in: 40..200 }
end
