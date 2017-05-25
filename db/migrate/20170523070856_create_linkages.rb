class CreateLinkages < ActiveRecord::Migration[5.0]
  def change
    create_table :linkages do |t|
      t.integer :sort, index: true
      t.boolean :visible, default: true, index: true
      t.string :title_en
      t.string :title_zh_cn
      t.string :title_zh_tw
      t.string :url_en
      t.string :url_zh_cn
      t.string :url_zh_tw

      t.timestamps
    end
  end
end
