class AddCoverToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :cover, :string
  end
end
