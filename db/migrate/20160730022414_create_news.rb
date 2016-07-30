class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string :category
      t.string :title_en
      t.string :title_zh_CN
      t.string :title_zh_TW
      t.datetime :published_at
      t.text :body_en
      t.text :body_zh_CN
      t.text :body_zh_TW

      t.timestamps
    end
  end
end
