class AddHeightToProfile < ActiveRecord::Migration[7.2]
  def change
    add_column :profiles, :height, :decimal
    add_column :profiles, :weight, :decimal
    add_column :profiles, :meals_per_day, :integer
  end
end
