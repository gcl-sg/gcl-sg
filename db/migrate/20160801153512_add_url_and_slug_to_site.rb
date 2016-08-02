class AddUrlAndSlugToSite < ActiveRecord::Migration[5.0]
  def change
    add_column :sites, :url, :string
    add_index :sites, :url, unique: true
    add_column :sites, :slug, :string
    add_index :sites, :slug, unique: true
  end
end
