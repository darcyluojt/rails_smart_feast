class RenameProfileTotalCalorieColumn < ActiveRecord::Migration[7.2]
  def change
    rename_column :profiles, :total_calorie, :calories_per_day
    rename_column :profiles, :total_protein, :protein_per_day
    rename_column :profiles, :total_carbs, :carbs_per_day
    change_column :profiles, :height, :integer
    change_column :profiles, :weight, :integer
  end
end
