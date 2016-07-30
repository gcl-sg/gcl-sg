class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.boolean :visible, default: true, index: true
      t.datetime :published_at
      t.string :title_en
      t.string :title_zh_cn
      t.string :title_zh_tw
      t.string :cover_en
      t.string :cover_zh_cn
      t.string :cover_zh_tw
      t.string :file_en
      t.string :file_zh_cn
      t.string :file_zh_tw
      t.boolean :enable_en, default: false, index: true
      t.boolean :enable_zh_cn, default: false, index: true
      t.boolean :enable_zh_tw, default: false, index: true

      t.timestamps
    end
  end
end
