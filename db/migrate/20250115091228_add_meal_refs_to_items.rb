class AddMealRefsToItems < ActiveRecord::Migration[7.2]
  def change
    add_column :items, :meal_refs, :integer, array: true, default: []
  end
end
