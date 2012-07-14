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

ActiveRecord::Schema.define(:version => 20120714174753) do

  create_table "commands", :force => true do |t|
    t.integer  "user_id"
    t.integer  "parent_id"
    t.string   "keyword"
    t.text     "url"
    t.string   "domain"
    t.string   "name"
    t.text     "description"
    t.boolean  "shared",           :default => true
    t.boolean  "use_http_post",    :default => false
    t.boolean  "use_url_encoding", :default => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.boolean  "bookmarklet",      :default => false
  end

  add_index "commands", ["keyword"], :name => "index_commands_on_keyword"
  add_index "commands", ["parent_id"], :name => "index_commands_on_sister_id"
  add_index "commands", ["user_id"], :name => "index_commands_on_user_id"

  create_table "queries", :force => true do |t|
    t.integer  "user_id"
    t.integer  "command_id"
    t.string   "input"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "queries", ["command_id"], :name => "index_queries_on_command_id"
  add_index "queries", ["user_id"], :name => "index_queries_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "nickname"
    t.string   "name"
    t.string   "location"
    t.string   "image"
    t.string   "description"
    t.string   "website"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "users", ["nickname"], :name => "index_users_on_nickname"

end
