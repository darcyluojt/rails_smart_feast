class CreateProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :profiles do |t|
      t.string :nickname
      t.string :gender
      t.boolean :yourself
      t.string :fitness_goal
      t.string :meal_plan
      t.integer :meals_per_day
      t.integer :calories_per_day
      t.integer :protein_per_day
      t.integer :carbs_per_day
      t.date :date_of_birth
      t.integer :height
      t.integer :weight
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
