class CreatePlates < ActiveRecord::Migration[5.0]
  def change
    create_table :plates do |t|
      t.boolean :visible, default: true, index: true
      t.integer :sort, index: true
      t.string :title_en
      t.string :title_zh_cn
      t.string :title_zh_tw
      t.string :sub_title_en
      t.string :sub_title_zh_cn
      t.string :sub_title_zh_tw
      t.string :desc_en
      t.string :desc_zh_cn
      t.string :desc_zh_tw
      t.string :image
      t.string :url
      t.string :color

      t.timestamps
    end
  end
end
