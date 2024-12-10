class CreateIngredients < ActiveRecord::Migration[7.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :calories_unit
      t.integer :protein_unit

      t.timestamps
    end
  end
end
