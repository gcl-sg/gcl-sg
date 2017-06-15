# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170615032753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "albums", force: :cascade do |t|
    t.boolean  "visible",      default: true
    t.datetime "published_at"
    t.string   "title_en"
    t.string   "title_zh_cn"
    t.string   "title_zh_tw"
    t.string   "cover_en"
    t.string   "cover_zh_cn"
    t.string   "cover_zh_tw"
    t.string   "file_en"
    t.string   "file_zh_cn"
    t.string   "file_zh_tw"
    t.boolean  "enable_en",    default: false
    t.boolean  "enable_zh_cn", default: false
    t.boolean  "enable_zh_tw", default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["enable_en"], name: "index_albums_on_enable_en", using: :btree
    t.index ["enable_zh_cn"], name: "index_albums_on_enable_zh_cn", using: :btree
    t.index ["enable_zh_tw"], name: "index_albums_on_enable_zh_tw", using: :btree
    t.index ["visible"], name: "index_albums_on_visible", using: :btree
  end

  create_table "banners", force: :cascade do |t|
    t.string   "cover"
    t.integer  "sort"
    t.boolean  "visible",           default: true
    t.string   "title_en"
    t.string   "title_zh_cn"
    t.string   "title_zh_tw"
    t.string   "description_en"
    t.string   "description_zh_cn"
    t.string   "description_zh_tw"
    t.string   "url"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["sort"], name: "index_banners_on_sort", using: :btree
    t.index ["visible"], name: "index_banners_on_visible", using: :btree
  end

  create_table "businesses", force: :cascade do |t|
    t.string   "title_en"
    t.string   "title_zh_cn"
    t.string   "title_zh_tw"
    t.string   "description_en"
    t.string   "description_zh_cn"
    t.string   "description_zh_tw"
    t.string   "cover"
    t.integer  "sort"
    t.boolean  "visible",           default: true
    t.string   "url"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["sort"], name: "index_businesses_on_sort", using: :btree
    t.index ["visible"], name: "index_businesses_on_visible", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.integer  "sort"
    t.boolean  "visible",    default: true
    t.string   "code"
    t.string   "name_en"
    t.string   "name_zh_cn"
    t.string   "name_zh_tw"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "cover"
    t.string   "slug"
    t.index ["slug"], name: "index_categories_on_slug", unique: true, using: :btree
    t.index ["visible"], name: "index_categories_on_visible", using: :btree
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree
  end

  create_table "company_profiles", force: :cascade do |t|
    t.string   "title_en"
    t.string   "title_zh_cn"
    t.string   "title_zh_tw"
    t.text     "description_en"
    t.text     "description_zh_cn"
    t.text     "description_zh_tw"
    t.string   "cover"
    t.integer  "sort"
    t.boolean  "visible",           default: true
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["sort"], name: "index_company_profiles_on_sort", using: :btree
    t.index ["visible"], name: "index_company_profiles_on_visible", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "galleries", force: :cascade do |t|
    t.integer  "site_id"
    t.boolean  "visible",     default: true
    t.integer  "sort"
    t.string   "title_en"
    t.string   "title_zh_cn"
    t.string   "title_zh_tw"
    t.string   "desc_en"
    t.string   "desc_zh_cn"
    t.string   "desc_zh_tw"
    t.string   "image"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["site_id"], name: "index_galleries_on_site_id", using: :btree
    t.index ["sort"], name: "index_galleries_on_sort", using: :btree
    t.index ["visible"], name: "index_galleries_on_visible", using: :btree
  end

  create_table "linkages", force: :cascade do |t|
    t.integer  "sort"
    t.boolean  "visible",     default: true
    t.string   "title_en"
    t.string   "title_zh_cn"
    t.string   "title_zh_tw"
    t.string   "url_en"
    t.string   "url_zh_cn"
    t.string   "url_zh_tw"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["sort"], name: "index_linkages_on_sort", using: :btree
    t.index ["visible"], name: "index_linkages_on_visible", using: :btree
  end

  create_table "news", force: :cascade do |t|
    t.integer  "category"
    t.string   "title_en"
    t.string   "title_zh_cn"
    t.string   "title_zh_tw"
    t.datetime "published_at"
    t.text     "body_en"
    t.text     "body_zh_cn"
    t.text     "body_zh_tw"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "enable_en",    default: false
    t.boolean  "enable_zh_cn", default: false
    t.boolean  "enable_zh_tw", default: false
    t.boolean  "visible",      default: true
    t.string   "cover"
    t.index ["category"], name: "index_news_on_category", using: :btree
    t.index ["enable_en"], name: "index_news_on_enable_en", using: :btree
    t.index ["enable_zh_cn"], name: "index_news_on_enable_zh_cn", using: :btree
    t.index ["enable_zh_tw"], name: "index_news_on_enable_zh_tw", using: :btree
  end

  create_table "plates", force: :cascade do |t|
    t.boolean  "visible",         default: true
    t.integer  "sort"
    t.string   "title_en"
    t.string   "title_zh_cn"
    t.string   "title_zh_tw"
    t.string   "sub_title_en"
    t.string   "sub_title_zh_cn"
    t.string   "sub_title_zh_tw"
    t.string   "desc_en"
    t.string   "desc_zh_cn"
    t.string   "desc_zh_tw"
    t.string   "image"
    t.string   "url"
    t.string   "color"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["sort"], name: "index_plates_on_sort", using: :btree
    t.index ["visible"], name: "index_plates_on_visible", using: :btree
  end

  create_table "sites", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "sort"
    t.boolean  "visible",     default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "title_en"
    t.string   "title_zh_cn"
    t.string   "title_zh_tw"
    t.text     "body_en"
    t.text     "body_zh_cn"
    t.text     "body_zh_tw"
    t.string   "url"
    t.string   "slug"
    t.index ["slug"], name: "index_sites_on_slug", unique: true, using: :btree
    t.index ["url"], name: "index_sites_on_url", using: :btree
    t.index ["visible"], name: "index_sites_on_visible", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "username"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  create_table "videos", force: :cascade do |t|
    t.boolean  "visible",      default: true
    t.datetime "published_at"
    t.string   "title_en"
    t.string   "title_zh_cn"
    t.string   "title_zh_tw"
    t.string   "cover_en"
    t.string   "cover_zh_cn"
    t.string   "cover_zh_tw"
    t.string   "file_en"
    t.string   "file_zh_cn"
    t.string   "file_zh_tw"
    t.boolean  "enable_en",    default: false
    t.boolean  "enable_zh_cn", default: false
    t.boolean  "enable_zh_tw", default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["enable_en"], name: "index_videos_on_enable_en", using: :btree
    t.index ["enable_zh_cn"], name: "index_videos_on_enable_zh_cn", using: :btree
    t.index ["enable_zh_tw"], name: "index_videos_on_enable_zh_tw", using: :btree
    t.index ["visible"], name: "index_videos_on_visible", using: :btree
  end

end
