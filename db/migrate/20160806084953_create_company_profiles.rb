class CreateCompanyProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :company_profiles do |t|
      t.string :title_en
      t.string :title_zh_cn
      t.string :title_zh_tw
      t.text :description_en
      t.text :description_zh_cn
      t.text :description_zh_tw
      t.string :cover
      t.integer :sort, index: true
      t.boolean :visible, default: true, index: true

      t.timestamps
    end
  end
end
