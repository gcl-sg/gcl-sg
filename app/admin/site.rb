ActiveAdmin.register Site do
  config.sort_order = 'sort_desc'

  permit_params :category_id, :sort, :visible, :title_en, :title_zh_CN, :title_zh_TW, :body_en, :body_zh_CN, :body_zh_TW
  filter :category

  index do
    selectable_column
    id_column
    column :category_id
    column :sort
    column :visible
    column :title
    actions
  end

  form do |f|
    f.inputs "Site Details" do
      f.input :category
      f.input :sort
      f.input :visible
      f.inputs "English" do
        f.input :title_en
        f.input :body_en, :as => :ckeditor
      end
      f.inputs "简体" do
        f.input :title_zh_CN
        f.input :body_zh_CN, :as => :ckeditor
      end
      f.inputs "繁体" do
        f.input :title_zh_TW
        f.input :body_zh_TW, :as => :ckeditor
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :category
      row :sort
      row :visible
      row :title_en
      row :body_en do |site|
        site.body_en.html_safe
      end
      row :title_zh_CN
      row :body_zh_CN do |site|
        site.body_zh_CN.html_safe
      end
      row :title_zh_TW
      row :body_zh_TW do |site|
        site.body_zh_TW.html_safe
      end
    end
    active_admin_comments
  end

end
