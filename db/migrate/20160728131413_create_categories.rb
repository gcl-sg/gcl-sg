class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.integer :sort
      t.boolean :visible
      t.string :code
      t.string :name_en
      t.string :name_zh_CN
      t.string :name_zh_TW

      t.timestamps
    end
  end
end
