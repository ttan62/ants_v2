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

ActiveRecord::Schema.define(:version => 20120709045435) do

  create_table "assignments", :force => true do |t|
    t.integer "project_id"
    t.integer "note_id"
  end

  add_index "assignments", ["note_id"], :name => "index_assignments_on_note_id"
  add_index "assignments", ["project_id"], :name => "index_assignments_on_project_id"

  create_table "notes", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "user"
    t.integer  "project_id"
    t.integer  "note_id"
    t.string   "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "project_searches", :force => true do |t|
    t.string   "all"
    t.string   "name"
    t.string   "description"
    t.string   "user"
    t.string   "tag"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "user"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
