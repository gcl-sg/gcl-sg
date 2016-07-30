class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.integer :category, index: true
      t.string :title_en
      t.string :title_zh_cn
      t.string :title_zh_tw
      t.datetime :published_at
      t.text :body_en
      t.text :body_zh_cn
      t.text :body_zh_tw

      t.timestamps
    end
  end
end
