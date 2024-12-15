class Profile < ApplicationRecord
  belongs_to :user
  has_many :profile_requirements
  has_many :requirements, through: :profile_requirements
end
