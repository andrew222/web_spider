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

ActiveRecord::Schema.define(version: 20141101094238) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "author_id"
    t.datetime "failed_at"
    t.datetime "last_reply_at"
    t.integer  "post_count"
    t.integer  "view_count"
    t.integer  "forum_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authors", force: true do |t|
    t.string   "name"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forums", force: true do |t|
    t.string   "url"
    t.string   "title"
    t.datetime "failed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.text     "content"
    t.datetime "posted_at"
    t.integer  "author_id"
    t.string   "post_link"
    t.integer  "article_id"
    t.integer  "forum_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.string   "site_type"
    t.boolean  "finished",   default: false
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
