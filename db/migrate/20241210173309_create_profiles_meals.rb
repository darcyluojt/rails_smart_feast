class CreateProfilesMeals < ActiveRecord::Migration[7.2]
  def change
    create_table :profiles_meals do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :meal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
