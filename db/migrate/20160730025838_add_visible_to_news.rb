class AddVisibleToNews < ActiveRecord::Migration[5.0]
  def change
    add_column :news, :visible, :boolean, default: true, index: true
  end
end
