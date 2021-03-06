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

ActiveRecord::Schema.define(version: 20151027124736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "critiques", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "review_id",   null: false
    t.integer  "keypoint_id", null: false
    t.string   "title",       null: false
    t.text     "body",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "critiques", ["keypoint_id"], name: "index_critiques_on_keypoint_id", using: :btree
  add_index "critiques", ["review_id"], name: "index_critiques_on_review_id", using: :btree
  add_index "critiques", ["user_id"], name: "index_critiques_on_user_id", using: :btree

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keypoints", force: :cascade do |t|
    t.string   "image_path", null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movie_genres", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "movie_genres", ["genre_id"], name: "index_movie_genres_on_genre_id", using: :btree
  add_index "movie_genres", ["movie_id"], name: "index_movie_genres_on_movie_id", using: :btree

  create_table "movies", force: :cascade do |t|
    t.string   "title",        null: false
    t.text     "synopsis",     null: false
    t.date     "release_date", null: false
    t.string   "director",     null: false
    t.string   "still_path"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "replies", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "critique_id", null: false
    t.text     "body",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "replies", ["critique_id"], name: "index_replies_on_critique_id", using: :btree
  add_index "replies", ["user_id"], name: "index_replies_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "movie_id",   null: false
    t.text     "body",       null: false
    t.string   "thesis",     null: false
    t.string   "title",      null: false
    t.integer  "rating",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reviews", ["movie_id"], name: "index_reviews_on_movie_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.integer  "keypoint_id", null: false
    t.integer  "review_id",   null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "topics", ["keypoint_id"], name: "index_topics_on_keypoint_id", using: :btree
  add_index "topics", ["review_id"], name: "index_topics_on_review_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",                        null: false
    t.string   "email",                           null: false
    t.string   "password_digest"
    t.boolean  "trusted",         default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "review_id",  null: false
    t.integer  "sentiment",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "votes", ["review_id"], name: "index_votes_on_review_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

  add_foreign_key "critiques", "keypoints"
  add_foreign_key "critiques", "reviews"
  add_foreign_key "critiques", "users"
  add_foreign_key "movie_genres", "genres"
  add_foreign_key "movie_genres", "movies"
  add_foreign_key "replies", "critiques"
  add_foreign_key "replies", "users"
  add_foreign_key "reviews", "movies"
  add_foreign_key "reviews", "users"
  add_foreign_key "topics", "keypoints"
  add_foreign_key "topics", "reviews"
  add_foreign_key "votes", "reviews"
  add_foreign_key "votes", "users"
end
