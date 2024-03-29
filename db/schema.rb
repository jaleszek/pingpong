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

ActiveRecord::Schema.define(version: 20140515232358) do

  create_table "authentication_tokens", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "auth_token", null: false
    t.datetime "expires_at", null: false
  end

  create_table "gist_contents", force: true do |t|
    t.string  "normalized",  null: false
    t.integer "gist_id",     null: false
    t.integer "language_id"
  end

  add_index "gist_contents", ["gist_id"], name: "index_gist_contents_on_gist_id"

  create_table "gists", force: true do |t|
    t.string   "name",       null: false
    t.integer  "owner_id",   null: false
    t.integer  "type_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gists", ["owner_id"], name: "index_gists_on_owner_id"

  create_table "gists_challenges", force: true do |t|
    t.integer "parent_gist_id",    null: false
    t.integer "challenge_gist_id", null: false
  end

  add_index "gists_challenges", ["challenge_gist_id"], name: "index_gists_challenges_on_challenge_gist_id"
  add_index "gists_challenges", ["parent_gist_id", "challenge_gist_id"], name: "index_gists_challenges_on_parent_gist_id_and_challenge_gist_id", unique: true

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

end
