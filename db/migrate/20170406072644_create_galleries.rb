class CreateGalleries < ActiveRecord::Migration[5.0]
  def change
    create_table :galleries do |t|
      t.references :site, index: true
      t.boolean :visible, default: true, index: true
      t.integer :sort, index: true
      t.string :title_en
      t.string :title_zh_cn
      t.string :title_zh_tw
      t.string :desc_en
      t.string :desc_zh_cn
      t.string :desc_zh_tw
      t.string :image

      t.timestamps
    end
  end
end
