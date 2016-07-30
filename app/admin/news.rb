ActiveAdmin.register News do
  config.sort_order = 'published_at_desc'

  menu priority: 4

  permit_params :category, :visible, :published_at, :title_en, :title_zh_CN, :title_zh_TW, :body_en, :body_zh_CN, :body_zh_TW
  filter :category
  filter :en_enable
  filter :zh_CN_enable
  filter :zh_TW_enable

  index do
    selectable_column
    id_column
    tag_column :category
    column :title
    bool_column :visible
    bool_column :en_enable
    bool_column :zh_CN_enable
    bool_column :zh_TW_enable
    actions
  end

  form do |f|
    f.inputs "News Details" do
      f.input :category
      f.input :visible
      f.input :published_at, as: :date_time_picker
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
      tag_row :category
      bool_row :visible
      row :published_at
      bool_row :en_enable
      row :title_en
      row :body_en do |record|
        record.body_en.html_safe
      end
      bool_row :zh_CN_enable
      row :title_zh_CN
      row :body_zh_CN do |record|
        record.body_zh_CN.html_safe
      end
      bool_row :zh_TW_enable
      row :title_zh_TW
      row :body_zh_TW do |record|
        record.body_zh_TW.html_safe
      end
    end
    active_admin_comments
  end

end
