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

ActiveRecord::Schema.define(version: 20140710011201) do

  create_table "sprints", force: true do |t|
    t.string   "name"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.string   "description"
    t.integer  "hours"
    t.integer  "user_id"
    t.integer  "user_story_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "task_type"
    t.string   "status"
    t.string   "user_name"
  end

  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id"
  add_index "tasks", ["user_story_id"], name: "index_tasks_on_user_story_id"

  create_table "teams", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sprint_id"
  end

  add_index "teams", ["sprint_id"], name: "index_teams_on_sprint_id"
  add_index "teams", ["user_id"], name: "index_teams_on_user_id"

  create_table "teams_users", force: true do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_stories", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "criteria"
    t.integer  "story_points"
    t.integer  "priority"
    t.integer  "estimated_hours"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sprint_id"
  end

  add_index "user_stories", ["sprint_id"], name: "index_user_stories_on_sprint_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
