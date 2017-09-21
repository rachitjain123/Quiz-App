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

ActiveRecord::Schema.define(version: 20160914183152) do

  create_table "ques", force: :cascade do |t|
    t.string   "category"
    t.text     "desc"
    t.text     "a"
    t.text     "b"
    t.text     "c"
    t.text     "d"
    t.integer  "QuizSet_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "ques", ["QuizSet_id"], name: "index_ques_on_QuizSet_id"

  create_table "questions", force: :cascade do |t|
    t.integer  "type"
    t.string   "desc"
    t.string   "a"
    t.string   "b"
    t.string   "c"
    t.string   "d"
    t.integer  "QuizerySet_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "questions", ["QuizerySet_id"], name: "index_questions_on_QuizerySet_id"

  create_table "quests", force: :cascade do |t|
    t.string   "type"
    t.text     "desc"
    t.text     "a"
    t.text     "b"
    t.text     "c"
    t.text     "d"
    t.integer  "QuizSet_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "quests", ["QuizSet_id"], name: "index_quests_on_QuizSet_id"

  create_table "responses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "Question_id"
    t.string   "response"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "responses", ["Question_id"], name: "index_responses_on_Question_id"
  add_index "responses", ["user_id"], name: "index_responses_on_user_id"

  create_table "resps", force: :cascade do |t|
    t.text     "response"
    t.integer  "Que_id"
    t.integer  "User_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "resps", ["Que_id"], name: "index_resps_on_Que_id"
  add_index "resps", ["User_id"], name: "index_resps_on_User_id"

  create_table "quiz_sets", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.boolean  "admin"
  end

  create_table "states", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "quiz_set_id"
    t.string   "solv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "states", ["quiz_set_id"], name: "index_states_on_quiz_set_id"
  add_index "states", ["user_id"], name: "index_states_on_user_id"

end
