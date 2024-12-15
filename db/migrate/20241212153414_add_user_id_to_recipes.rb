class AddUserIdToRecipes < ActiveRecord::Migration[7.2]
  def change
    add_reference :recipes, :user, foreign_key: true
  end
end