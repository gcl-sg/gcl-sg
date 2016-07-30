class CreateSites < ActiveRecord::Migration[5.0]
  def change
    create_table :sites do |t|
      t.integer  :category_id
      t.integer  :sort
      t.string   :title
      t.text     :body
      t.boolean  :visible, default: true, index: true
      t.datetime :published_at
      t.timestamps
    end
  end
end
