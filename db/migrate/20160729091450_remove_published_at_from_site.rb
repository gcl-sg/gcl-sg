class RemovePublishedAtFromSite < ActiveRecord::Migration[5.0]
  def change
    remove_column :sites, :published_at, :datetime
  end
end
