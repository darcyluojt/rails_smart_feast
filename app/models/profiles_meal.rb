class ProfilesMeal < ApplicationRecord
  belongs_to :profile
  belongs_to :meal
end
