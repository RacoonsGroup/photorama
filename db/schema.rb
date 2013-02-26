# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130226135216) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "backgrounds", :force => true do |t|
    t.string   "name"
    t.string   "background"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "color_schemes", :force => true do |t|
    t.string   "name"
    t.string   "color1"
    t.string   "color2"
    t.string   "color3"
    t.string   "color4"
    t.string   "color5"
    t.string   "color6"
    t.string   "color7"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "main_page_attrs", :force => true do |t|
    t.text     "content"
    t.boolean  "gallery_toggle"
    t.integer  "main_page_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "main_page_attrs", ["main_page_id"], :name => "index_main_page_attrs_on_main_page_id"

  create_table "page_modules", :force => true do |t|
    t.string   "anchor"
    t.string   "slug"
    t.integer  "project_id"
    t.string   "type"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "deleted",    :default => false
    t.datetime "deleted_at"
  end

  add_index "page_modules", ["project_id"], :name => "index_page_modules_on_project_id"
  add_index "page_modules", ["slug"], :name => "index_page_modules_on_slug"

  create_table "projects", :force => true do |t|
    t.string   "subdomain"
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "template_id"
    t.integer  "color_scheme_id"
    t.integer  "background_id"
  end

  add_index "projects", ["subdomain"], :name => "index_projects_on_subdomain", :unique => true
  add_index "projects", ["user_id"], :name => "index_projects_on_user_id"

  create_table "redactor_assets", :force => true do |t|
    t.integer  "user_id"
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], :name => "idx_redactor_assetable"
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_redactor_assetable_type"

  create_table "static_page_attrs", :force => true do |t|
    t.text     "content"
    t.integer  "static_page_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "static_page_attrs", ["static_page_id"], :name => "index_static_page_attrs_on_static_page_id"

  create_table "templates", :force => true do |t|
    t.string   "name"
    t.string   "layout_name"
    t.string   "thumbnail"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "full_name"
    t.string   "telephone"
    t.string   "city"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
