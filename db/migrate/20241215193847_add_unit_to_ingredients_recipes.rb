class AddUnitToIngredientsRecipes < ActiveRecord::Migration[7.2]
  def change
    add_column :ingredients_recipes, :unit, :string
  end
end
