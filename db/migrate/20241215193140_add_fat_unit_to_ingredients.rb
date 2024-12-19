class AddFatUnitToIngredients < ActiveRecord::Migration[7.2]
  def change
    add_column :ingredients, :fat_unit, :integer
    add_column :ingredients, :carbs_unit, :integer
  end
end
