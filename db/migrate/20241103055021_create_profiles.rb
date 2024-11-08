class CreateProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :profiles do |t|
      t.string :nickname
      t.string :gender
      t.boolean :yourself
      t.string :fitness_goal
      t.string :meal_plan
      t.integer :total_calorie
      t.integer :total_protein
      t.integer :total_carbs

      t.timestamps
    end
  end
end
