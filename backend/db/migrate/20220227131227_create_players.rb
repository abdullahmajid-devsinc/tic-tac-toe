# frozen_string_literal: true

class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name, null: false, limit: 100
      t.timestamps
    end

    add_index :players, :name, unique: true
  end
end
