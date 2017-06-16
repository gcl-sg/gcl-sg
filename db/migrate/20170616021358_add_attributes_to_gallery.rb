class AddAttributesToGallery < ActiveRecord::Migration[5.0]
  def change
    add_column :galleries, :sub_title_en, :string
    add_column :galleries, :sub_title_zh_cn, :string
    add_column :galleries, :sub_title_zh_tw, :string
    add_column :galleries, :color, :string
    add_column :sites, :gallery_type, :integer
    add_index  :sites, :gallery_type
  end
end
