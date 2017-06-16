ActiveAdmin.register Site do
  config.sort_order = 'category_id_asc_and_sort_asc'

  menu priority: 4

  permit_params :category_id, :sort, :url, :visible, :title_en, :title_zh_cn, :title_zh_tw, :body_en, :body_zh_cn, :body_zh_tw, :gallery_type, gallery_ids: [], galleries_attributes: [:id, :site_id, :sort, :color, :title_en, :title_zh_cn, :title_zh_tw, :sub_title_en, :sub_title_zh_cn, :sub_title_zh_tw, :desc_en, :desc_zh_cn, :desc_zh_tw, :image, :image_cache, :_destroy]
  filter :category

  index do
    selectable_column
    id_column
    column :title
    column :category
    column :sort
    column :url
    bool_column :visible
    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Site Details" do
      f.input :category
      f.input :sort
      f.input :url
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
      f.inputs "图片集管理" do
        f. input :gallery_type, collection: Site.gallery_types_i18n.invert
        f.has_many :galleries, sortable: :sort, sortable_start: 1, allow_destroy: true do |g|
          g.input :visible
          g.input :sort
          g.input :image, :as => :file, :hint => g.object.image.present? ? image_tag(g.object.image.thumbnail.url) : content_tag(:span, "no gallery iamge")
          g.input :image_cache, :as => :hidden
          g.input :color
          g.input :title_en
          g.input :title_zh_cn
          g.input :title_zh_tw
          g.input :sub_title_en
          g.input :sub_title_zh_cn
          g.input :sub_title_zh_tw
          g.input :desc_en, :as => :text, input_html: {rows: 3}
          g.input :desc_zh_cn, :as => :text, input_html: {rows: 3}
          g.input :desc_zh_tw, :as => :text, input_html: {rows: 3}
        end
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :category
      row :sort
      row :url
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
      row :gallery_type do |record|
        record.gallery_type_i18n
      end
      panel "图片集" do
        table_for site.galleries do
          column :visible
          column :title_en
          column :title_zh_cn
          column :title_zh_tw
          column :image do |record|
            record.image.present? ? image_tag(record.image.thumbnail.url) : content_tag(:span, "no gallery image")
          end
        end
      end
    end
    active_admin_comments
  end

end
