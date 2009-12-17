# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091217081304) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.string   "ac_number"
    t.string   "location"
    t.text     "address"
    t.text     "description"
    t.text     "other_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.string   "location"
    t.datetime "date_of_event"
    t.string   "emphasis"
    t.string   "author"
    t.text     "information"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tag"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "dorm_accounts", :force => true do |t|
    t.string   "name"
    t.string   "ac_number"
    t.string   "location"
    t.text     "address"
    t.text     "description"
    t.text     "other_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.string   "location"
    t.datetime "date_of_event"
    t.string   "emphasis"
    t.string   "author"
    t.text     "information"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tag"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "galleries", :force => true do |t|
    t.string   "title"
    t.string   "location"
    t.datetime "date_of_event"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "guestbooks", :force => true do |t|
    t.string   "title"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presses", :force => true do |t|
    t.string   "title"
    t.string   "location"
    t.datetime "date_of_event"
    t.string   "emphasis"
    t.string   "author"
    t.text     "information"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tag"
  end

  create_table "quotes", :force => true do |t|
    t.string   "passage"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

end
