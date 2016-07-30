class AddLocaleFlagToNews < ActiveRecord::Migration[5.0]
  def change
    add_column :news, :en_enable, :boolean, default: false
    add_column :news, :zh_CN_enable, :boolean, default: false
    add_column :news, :zh_TW_enable, :boolean, default: false
  end
end
