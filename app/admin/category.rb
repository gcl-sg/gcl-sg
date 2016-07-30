ActiveAdmin.register Category do
  config.filters = false
  config.sort_order = 'category_id_asc, sort_asc'

  permit_params :sort, :visible, :code, :cover, :name_en, :name_zh_CN, :name_zh_TW

  index do
    selectable_column
    id_column
    column :sort
    column :visible
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
        f.input :name_zh_CN
        f.input :name_zh_TW
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
      row :visible
      row :code
      row :name_en
      row :name_zh_CN
      row :name_zh_TW
      row :cover do |category|
        category.cover.present? ? image_tag(category.cover.url(:thumbnail)) : content_tag(:span, "no cover image")
      end
    end
    active_admin_comments
  end

  scope :all, default: true

end
