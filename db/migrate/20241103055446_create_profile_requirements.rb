class CreateProfileRequirements < ActiveRecord::Migration[7.2]
  def change
    create_table :profile_requirements do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :requirement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
