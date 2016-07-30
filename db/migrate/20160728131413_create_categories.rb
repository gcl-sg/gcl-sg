class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.integer :sort
      t.boolean :visible, default: true, index: true
      t.string :code
      t.string :name_en
      t.string :name_zh_cn
      t.string :name_zh_tw

      t.timestamps
    end
  end
end
