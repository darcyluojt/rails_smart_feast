class CreateRequirements < ActiveRecord::Migration[7.2]
  def change
    create_table :requirements do |t|
      t.string :name

      t.timestamps
    end
  end
end
