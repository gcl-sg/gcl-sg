class AddMultipleLocaleForSite < ActiveRecord::Migration[5.0]
  def change
    add_column :sites, :title_en, :string
    add_column :sites, :title_zh_CN, :string
    add_column :sites, :title_zh_TW, :string
    add_column :sites, :body_en, :text
    add_column :sites, :body_zh_CN, :text
    add_column :sites, :body_zh_TW, :text
    remove_column :sites, :title
    remove_column :sites, :body
  end
end
