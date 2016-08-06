class CreateBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses do |t|
      t.string :title_en
      t.string :title_zh_cn
      t.string :title_zh_tw
      t.string :description_en
      t.string :description_zh_cn
      t.string :description_zh_tw
      t.string :cover
      t.integer :sort, index: true
      t.boolean :visible, default: true, index: true
      t.string :url

      t.timestamps
    end
  end
end
