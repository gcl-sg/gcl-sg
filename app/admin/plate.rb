ActiveAdmin.register Plate do

  config.sort_order = 'sort_asc'

  menu parent: :home, priority: 5

  permit_params :visible, :sort, :image, :image_cache, :url, :title_en, :title_zh_cn, :title_zh_tw, :sub_title_en, :sub_title_zh_cn, :sub_title_zh_tw, :desc_en, :desc_zh_cn, :desc_zh_tw, :color
  filter :visible

  index do
    selectable_column
    id_column
    column :sort
    column :title
    column :url
    bool_column :visible
    column :image do |record|
      image_tag record.image.thumbnail.url
    end
    actions
  end

  form do |f|
    f.inputs "Plate Details" do
      f.input :visible
      f.input :sort
      f.input :url
      f.input :image, :as => :file, :hint => f.object.image.present? ? image_tag(f.object.image.url(:thumbnail)) : content_tag(:span, "no iamge")
      f.input :image_cache, :as => :hidden
      f.input :color
      f.inputs "English" do
        f.input :title_en
        f.input :sub_title_en
        f.input :desc_en
      end
      f.inputs "简体" do
        f.input :title_zh_cn
        f.input :sub_title_zh_cn
        f.input :desc_zh_cn
      end
      f.inputs "繁体" do
        f.input :title_zh_tw
        f.input :sub_title_zh_tw
        f.input :desc_zh_tw
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
      row :image do |record|
        record.image.present? ? image_tag(record.image.url(:thumbnail)) : content_tag(:span, "no image")
      end
      row :color
      row :title_en
      row :sub_title_en
      row :desc_en
      row :title_zh_cn
      row :sub_title_zh_cn
      row :desc_zh_cn
      row :title_zh_tw
      row :sub_title_zh_tw
      row :desc_zh_tw
    end
    active_admin_comments
  end
end

