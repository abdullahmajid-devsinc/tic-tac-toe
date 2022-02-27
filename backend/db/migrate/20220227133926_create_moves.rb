# frozen_string_literal: true

class CreateMoves < ActiveRecord::Migration[6.1]
  def change
    create_table :moves do |t|
      t.belongs_to :player, index: true, foreign_key: true, null: false
      t.integer :cell, min: 1, max: 9
      t.timestamps
    end
  end
end
