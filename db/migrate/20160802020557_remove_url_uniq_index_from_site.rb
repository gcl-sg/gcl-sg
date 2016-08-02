class RemoveUrlUniqIndexFromSite < ActiveRecord::Migration[5.0]
  def change
    remove_index :sites, :url
    add_index :sites, :url
  end
end
