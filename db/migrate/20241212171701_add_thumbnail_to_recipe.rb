class AddThumbnailToRecipe < ActiveRecord::Migration[7.2]
  def change
    add_column :recipes, :thumbnail, :text
    add_column :recipes, :category, :text, array: true, default: []
  end
end
