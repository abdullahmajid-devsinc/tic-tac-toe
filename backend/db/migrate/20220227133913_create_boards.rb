# frozen_string_literal: true

class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.belongs_to :player1, index: true, foreign_key: { to_table: :players }, null: false
      t.belongs_to :player2, index: true, foreign_key: { to_table: :players }, null: false
      t.belongs_to :winner, index: true, foreign_key: { to_table: :players }
      t.timestamps
    end
  end
end
