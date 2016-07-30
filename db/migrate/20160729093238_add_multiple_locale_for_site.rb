class AddMultipleLocaleForSite < ActiveRecord::Migration[5.0]
  def change
    add_column :sites, :title_en, :string
    add_column :sites, :title_zh_cn, :string
    add_column :sites, :title_zh_tw, :string
    add_column :sites, :body_en, :text
    add_column :sites, :body_zh_cn, :text
    add_column :sites, :body_zh_tw, :text
    remove_column :sites, :title
    remove_column :sites, :body
  end
end
