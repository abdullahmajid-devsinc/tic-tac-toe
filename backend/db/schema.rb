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

ActiveRecord::Schema.define(version: 2022_02_27_133926) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.bigint "player1_id", null: false
    t.bigint "player2_id", null: false
    t.bigint "winner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player1_id"], name: "index_boards_on_player1_id"
    t.index ["player2_id"], name: "index_boards_on_player2_id"
    t.index ["winner_id"], name: "index_boards_on_winner_id"
  end

  create_table "moves", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "board_id", null: false
    t.integer "cell"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["board_id"], name: "index_moves_on_board_id"
    t.index ["player_id"], name: "index_moves_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_players_on_name", unique: true
  end

  add_foreign_key "boards", "players", column: "player1_id"
  add_foreign_key "boards", "players", column: "player2_id"
  add_foreign_key "boards", "players", column: "winner_id"
  add_foreign_key "moves", "boards"
  add_foreign_key "moves", "players"
end
