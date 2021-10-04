# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_04_093108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adoption_levels", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.text "editorial"
    t.index ["slug"], name: "index_adoption_levels_on_slug", unique: true
  end

  create_table "assignments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_assignments_on_role_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id", "version"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "business_forms", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "editorial"
    t.index ["slug"], name: "index_business_forms_on_slug", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.text "editorial"
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "categories_technologies", id: false, force: :cascade do |t|
    t.bigint "technology_id", null: false
    t.bigint "category_id", null: false
    t.index ["category_id", "technology_id"], name: "index_cat_tech_2", unique: true
    t.index ["technology_id", "category_id"], name: "index_cat_tech_1", unique: true
  end

  create_table "collections", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "editorial"
    t.index ["slug"], name: "index_collections_on_slug", unique: true
  end

  create_table "collections_technologies", id: false, force: :cascade do |t|
    t.bigint "technology_id", null: false
    t.bigint "collection_id", null: false
    t.index ["collection_id", "technology_id"], name: "index_coll_tech_2", unique: true
    t.index ["technology_id", "collection_id"], name: "index_coll_tech_1", unique: true
  end

  create_table "dependencies", force: :cascade do |t|
    t.bigint "technology_id", null: false
    t.bigint "dependee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dependee_id"], name: "index_dependencies_on_dependee_id"
    t.index ["technology_id", "dependee_id"], name: "index_dependencies_on_technology_id_and_dependee_id", unique: true
    t.index ["technology_id"], name: "index_dependencies_on_technology_id"
  end

  create_table "editorial_states", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_editorial_states_on_slug", unique: true
  end

  create_table "functions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.text "editorial"
    t.index ["slug"], name: "index_functions_on_slug", unique: true
  end

  create_table "functions_technologies", id: false, force: :cascade do |t|
    t.bigint "technology_id", null: false
    t.bigint "function_id", null: false
    t.index ["function_id", "technology_id"], name: "index_func_tech_2", unique: true
    t.index ["technology_id", "function_id"], name: "index_func_tech_1", unique: true
  end

  create_table "governances", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "editorial"
    t.index ["slug"], name: "index_governances_on_slug", unique: true
  end

  create_table "readiness_levels", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.text "editorial"
    t.index ["slug"], name: "index_readiness_levels_on_slug", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.text "editorial"
    t.index ["slug"], name: "index_roles_on_slug", unique: true
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "editorial"
    t.index ["slug"], name: "index_statuses_on_slug", unique: true
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "technologies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "url"
    t.bigint "adoption_level_id"
    t.bigint "readiness_level_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.text "editorial"
    t.bigint "governance_id"
    t.string "roadmap"
    t.string "codebase"
    t.string "hosting"
    t.string "pricing"
    t.string "licensing"
    t.bigint "business_form_id"
    t.bigint "status_id"
    t.bigint "editorial_state_id"
    t.index ["adoption_level_id"], name: "index_technologies_on_adoption_level_id"
    t.index ["business_form_id"], name: "index_technologies_on_business_form_id"
    t.index ["editorial_state_id"], name: "index_technologies_on_editorial_state_id"
    t.index ["governance_id"], name: "index_technologies_on_governance_id"
    t.index ["readiness_level_id"], name: "index_technologies_on_readiness_level_id"
    t.index ["slug"], name: "index_technologies_on_slug", unique: true
    t.index ["status_id"], name: "index_technologies_on_status_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "forenames"
    t.string "lastname"
    t.text "editorial"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assignments", "roles"
  add_foreign_key "assignments", "users"
  add_foreign_key "dependencies", "technologies"
  add_foreign_key "dependencies", "technologies", column: "dependee_id"
  add_foreign_key "taggings", "tags"
  add_foreign_key "technologies", "adoption_levels"
  add_foreign_key "technologies", "business_forms"
  add_foreign_key "technologies", "editorial_states"
  add_foreign_key "technologies", "governances"
  add_foreign_key "technologies", "readiness_levels"
  add_foreign_key "technologies", "statuses"
end
