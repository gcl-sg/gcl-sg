ActiveAdmin.register News do
  config.sort_order = 'published_at_desc'

  menu priority: 4

  permit_params :category, :visible, :published_at, :title_en, :title_zh_cn, :title_zh_tw, :body_en, :body_zh_cn, :body_zh_tw
  filter :visible
  filter :category, as: :check_boxes, collection: proc { News.categories_id_i18n }
  filter :enable_en
  filter :enable_zh_cn
  filter :enable_zh_tw

  index do
    selectable_column
    id_column
    column :category do |record|
      record.category_i18n
    end
    column :title
    bool_column :visible
    bool_column :enable_en
    bool_column :enable_zh_cn
    bool_column :enable_zh_tw
    actions
  end

  form do |f|
    f.inputs "News Details" do
      f.input :category, as: :radio, collection: News.categories_i18n.invert
      f.input :visible
      f.input :published_at, as: :date_time_picker
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
      row :category do |record|
        record.category_i18n
      end
      bool_row :visible
      row :published_at
      bool_row :enable_en
      row :title_en
      row :body_en do |record|
        record.body_en.html_safe
      end
      bool_row :enable_zh_cn
      row :title_zh_cn
      row :body_zh_cn do |record|
        record.body_zh_cn.html_safe
      end
      bool_row :enable_zh_tw
      row :title_zh_tw
      row :body_zh_tw do |record|
        record.body_zh_tw.html_safe
      end
    end
    active_admin_comments
  end

end
