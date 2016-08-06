ActiveAdmin.register Video do
  config.sort_order = 'published_at_desc'

  menu priority: 7

  permit_params :visible, :published_at, :title_en, :title_zh_cn, :title_zh_tw, :cover_en, :cover_zh_cn, :cover_zh_tw, :cover_en_cache, :cover_zh_cn_cache, :cover_zh_tw_cache, :file_en, :file_zh_cn, :file_zh_tw, :file_en_cache, :file_zh_cn_cache, :file_zh_tw_cache
  filter :visible
  filter :enable_en
  filter :enable_zh_cn
  filter :enable_zh_tw

  index do
    selectable_column
    id_column
    column :title
    bool_column :visible
    bool_column :enable_en
    bool_column :enable_zh_cn
    bool_column :enable_zh_tw
    actions
  end

  form do |f|
    f.inputs "Video Details" do
      f.input :visible
      f.input :published_at, as: :date_time_picker
      f.inputs "English" do
        f.input :title_en
        f.input :cover_en, :as => :file, :hint => f.object.cover_en.present? ? image_tag(f.object.cover_en.url(:thumbnail)) : content_tag(:span, "no cover iamge")
        f.input :cover_en_cache, :as => :hidden
        f.input :file_en, :as => :file, :hint => f.object.file_en.present? ? link_to(f.object.file_en.file.filename, f.object.file_en.url) : content_tag(:span, "no video file")
        f.input :file_en_cache, :as => :hidden
      end
      f.inputs "简体" do
        f.input :title_zh_cn
        f.input :cover_zh_cn, :as => :file, :hint => f.object.cover_zh_cn.present? ? image_tag(f.object.cover_zh_cn.url(:thumbnail)) : content_tag(:span, "no cover iamge")
        f.input :cover_zh_cn_cache, :as => :hidden
        f.input :file_zh_cn, :as => :file, :hint => f.object.file_zh_cn.present? ? link_to(f.object.file_zh_cn.file.filename, f.object.file_zh_cn.url) : content_tag(:span, "no video file")
        f.input :file_zh_cn_cache, :as => :hidden
      end
      f.inputs "繁体" do
        f.input :title_zh_tw
        f.input :cover_zh_tw, :as => :file, :hint => f.object.cover_zh_tw.present? ? image_tag(f.object.cover_zh_tw.url(:thumbnail)) : content_tag(:span, "no cover iamge")
        f.input :cover_zh_tw_cache, :as => :hidden
        f.input :file_zh_tw, :as => :file, :hint => f.object.file_zh_tw.present? ? link_to(f.object.file_zh_tw.file.filename, f.object.file_zh_tw.url) : content_tag(:span, "no video file")
        f.input :file_zh_tw_cache, :as => :hidden
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      bool_row :visible
      row :published_at
      bool_row :enable_en
      row :title_en
      row :cover_en do |record|
        record.cover_en.present? ? image_tag(record.cover_en.url(:thumbnail)) : content_tag(:span, "no cover image")
      end
      row :file_en do |record|
        record.file_en.present? ? link_to(record.file_en.file.filename, record.file_en.url) : content_tag(:span, "no video file")
      end
      bool_row :enable_zh_cn
      row :title_zh_cn
      row :cover_zh_cn do |record|
        record.cover_zh_cn.present? ? image_tag(record.cover_zh_cn.url(:thumbnail)) : content_tag(:span, "no cover image")
      end
      row :file_zh_cn do |record|
        record.file_zh_cn.present? ? link_to(record.file_zh_cn.file.filename, record.file_zh_cn.url) : content_tag(:span, "no video file")
      end
      bool_row :enable_zh_tw
      row :title_zh_tw
      row :cover_zh_tw do |record|
        record.cover_zh_tw.present? ? image_tag(record.cover_zh_tw.url(:thumbnail)) : content_tag(:span, "no video image")
      end
      row :file_zh_tw do |record|
        record.file_zh_tw.present? ? link_to(record.file_zh_tw.file.filename, record.file_zh_tw.url) : content_tag(:span, "no album file")
      end
    end
    active_admin_comments
  end

end
