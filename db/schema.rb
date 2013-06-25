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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130625040446) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["name"], name: "index_categories_on_name"

  create_table "categories_posts", force: true do |t|
    t.integer "category_id"
    t.integer "post_id"
  end

  add_index "categories_posts", ["category_id"], name: "index_categories_posts_on_category_id"
  add_index "categories_posts", ["post_id"], name: "index_categories_posts_on_post_id"

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone_number"
    t.string   "service_type"
    t.string   "event_venue"
    t.date     "event_at"
    t.string   "party_size"
    t.time     "ready_time"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.string   "link"
    t.string   "guid"
    t.text     "description"
    t.text     "html"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["created_at"], name: "index_posts_on_created_at"
  add_index "posts", ["guid"], name: "index_posts_on_guid"
  add_index "posts", ["link"], name: "index_posts_on_link"

end
