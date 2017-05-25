ActiveAdmin.register Linkage do
  config.sort_order = 'sort_asc'

  menu parent: :home, priority: 4

  permit_params :sort, :visible, :title_en, :title_zh_cn, :title_zh_tw, :url_en, :url_zh_cn, :url_zh_tw
  filter :visible

  index do
    selectable_column
    id_column
    column :sort
    bool_column :visible
    column :title
    column :url
    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Linkage Details" do
      f.input :sort
      f.input :visible
      f.inputs "English" do
        f.input :title_en
        f.input :url_en
      end
      f.inputs "简体" do
        f.input :title_zh_cn
        f.input :url_zh_cn
      end
      f.inputs "繁体" do
        f.input :title_zh_tw
        f.input :url_zh_tw
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :sort
      bool_row :visible
      row :title_en
      row :url_en
      row :title_zh_cn
      row :url_zh_cn
      row :title_zh_tw
      row :url_zh_tw
    end
    active_admin_comments
  end

end
