ActiveAdmin.register Site do
  config.sort_order = 'sort_desc'

  menu priority: 3

  permit_params :category_id, :sort, :visible, :title_en, :title_zh_cn, :title_zh_tw, :body_en, :body_zh_cn, :body_zh_tw
  filter :category

  index do
    selectable_column
    id_column
    column :category_id
    column :sort
    bool_column :visible
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
        f.input :title_zh_cn
        f.input :body_zh_cn, :as => :ckeditor
      end
      f.inputs "繁体" do
        f.input :title_zh_tw
        f.input :body_zh_tw, :as => :ckeditor
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :category
      row :sort
      bool_row :visible
      row :title_en
      row :body_en do |site|
        site.body_en.html_safe
      end
      row :title_zh_cn
      row :body_zh_cn do |site|
        site.body_zh_cn.html_safe
      end
      row :title_zh_tw
      row :body_zh_tw do |site|
        site.body_zh_tw.html_safe
      end
    end
    active_admin_comments
  end

end
