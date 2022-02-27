# frozen_string_literal: true

class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards, &:timestamps
  end
end
