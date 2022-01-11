# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_09_131031) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "name", limit: 100, default: ""
    t.text "description", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "label_id"
    t.index ["label_id"], name: "index_books_on_label_id"
  end

  create_table "combos", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "song_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "label_id"
    t.index ["book_id"], name: "index_combos_on_book_id"
    t.index ["label_id"], name: "index_combos_on_label_id"
    t.index ["song_id"], name: "index_combos_on_song_id"
  end

  create_table "items_labels", force: :cascade do |t|
    t.bigint "source_id", null: false
    t.bigint "label_id"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["label_id"], name: "index_items_labels_on_label_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "name", limit: 100, default: ""
    t.text "description", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "name", limit: 100, default: ""
    t.text "description", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "label_id"
    t.index ["label_id"], name: "index_songs_on_label_id"
  end

end
