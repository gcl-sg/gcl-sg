ActiveAdmin.register Category do
  config.filters = false
  config.sort_order = 'sort_asc'

  menu priority: 2

  permit_params :sort, :visible, :code, :cover, :cover_cache, :name_en, :name_zh_cn, :name_zh_tw

  index do
    selectable_column
    id_column
    column :sort
    bool_column :visible
    column :code
    column :name
    actions
  end

  form do |f|
    f.inputs "Category Details" do
      f.input :sort
      f.input :visible
      f.input :code

      f.inputs "标题" do
        f.input :name_en
        f.input :name_zh_cn
        f.input :name_zh_tw
      end

      f.inputs "图片管理", :multipart => true do
        f.input :cover, :as => :file, :hint => f.object.cover.present? ? image_tag(f.object.cover.url(:thumbnail)) : content_tag(:span, "no cover image")
        f.input :cover_cache, :as => :hidden
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :sort
      bool_row :visible
      row :code
      row :name_en
      row :name_zh_cn
      row :name_zh_tw
      row :cover do |category|
        category.cover.present? ? image_tag(category.cover.url(:thumbnail)) : content_tag(:span, "no cover image")
      end
    end
    active_admin_comments
  end

  scope :all, default: true

end
