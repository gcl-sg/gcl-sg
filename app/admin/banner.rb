ActiveAdmin.register Banner do

  config.sort_order = 'sort_asc'

  menu parent: :home, priority: 1

  permit_params :visible, :sort, :cover, :cover_cache, :url, :title_en, :title_zh_cn, :title_zh_tw, :description_en, :description_zh_cn, :description_zh_tw
  filter :visible

  index do
    selectable_column
    id_column
    column :sort
    column :title
    column :url
    bool_column :visible
    column :cover do |record|
      image_tag record.cover.thumbnail.url
    end
    actions
  end

  form do |f|
    f.inputs "Banner Details" do
      f.input :visible
      f.input :sort
      f.input :url
      f.input :cover, :as => :file, :hint => f.object.cover.present? ? image_tag(f.object.cover.url(:thumbnail)) : content_tag(:span, "no cover iamge")
      f.input :cover_cache, :as => :hidden
      f.inputs "English" do
        f.input :title_en
        f.input :description_en, :as => :text, input_html: {rows: 5}
      end
      f.inputs "简体" do
        f.input :title_zh_cn
        f.input :description_zh_cn, :as => :text, input_html: {rows: 5}
      end
      f.inputs "繁体" do
        f.input :title_zh_tw
        f.input :description_zh_tw, :as => :text, input_html: {rows: 5}
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      bool_row :visible
      row :sort
      row :url
      row :cover do |record|
        record.cover.present? ? image_tag(record.cover.url(:thumbnail)) : content_tag(:span, "no cover image")
      end
      row :title_en
      row :description_en
      row :title_zh_cn
      row :description_zh_cn
      row :title_zh_tw
      row :description_zh_tw
    end
    active_admin_comments
  end
end
