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

ActiveRecord::Schema.define(:version => 20130610203859) do

  create_table "acts", :force => true do |t|
    t.integer  "gig_id"
    t.integer  "band_id"
    t.boolean  "is_main_act", :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "band_images", :force => true do |t|
    t.string   "file"
    t.boolean  "is_main",    :default => false
    t.integer  "band_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "band_participations", :force => true do |t|
    t.integer  "band_id"
    t.integer  "user_id"
    t.date     "date_joined"
    t.boolean  "pending",     :default => true
    t.boolean  "is_admin",    :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "bands", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "creation_year"
    t.string   "city"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "comment_ratings", :force => true do |t|
    t.boolean  "is_useful"
    t.integer  "feedback_comment_id"
    t.integer  "user_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "feedback_comments", :force => true do |t|
    t.text     "description"
    t.integer  "feedback_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "feedback_ratings", :force => true do |t|
    t.boolean  "is_useful"
    t.integer  "feedback_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "feedbacks", :force => true do |t|
    t.text     "description"
    t.integer  "rating"
    t.integer  "venue_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "gigs", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "soundcheck_time"
    t.datetime "doors_time"
    t.datetime "concert_start_time"
    t.datetime "concert_end_time"
    t.integer  "venue_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "poster"
  end

  create_table "managerships", :force => true do |t|
    t.integer  "venue_id"
    t.integer  "user_id"
    t.boolean  "is_admin",   :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

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
    t.string   "first_name",             :default => ""
    t.string   "last_name",              :default => ""
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "avatar"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["first_name"], :name => "index_users_on_first_name"
  add_index "users", ["last_name"], :name => "index_users_on_last_name"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "venue_images", :force => true do |t|
    t.integer  "venue_id"
    t.string   "file"
    t.boolean  "is_main",    :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "postal_code"
    t.string   "city"
    t.string   "country"
    t.string   "telephone"
    t.string   "email_address"
    t.string   "website"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
  end

end
