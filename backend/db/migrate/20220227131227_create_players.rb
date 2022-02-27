# frozen_string_literal: true

class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name, null: false, default: '', unique: true
      t.belongs_to :player1, index: true, foreign_key: { to_table: :players }, null: false
      t.belongs_to :player2, index: true, foreign_key: { to_table: :players }, null: false
      t.belongs_to :winner, index: true, foreign_key: { to_table: :players }
      t.timestamps
    end
  end
end
