class AddLocaleFlagToNews < ActiveRecord::Migration[5.0]
  def change
    add_column :news, :enable_en, :boolean, default: false, index: true
    add_column :news, :enable_zh_cn, :boolean, default: false, index: true
    add_column :news, :enable_zh_tw, :boolean, default: false, index: true
    add_index :news, :enable_en
    add_index :news, :enable_zh_cn
    add_index :news, :enable_zh_tw
  end
end
