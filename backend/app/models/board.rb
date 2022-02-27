# frozen_string_literal: true

class Board < ApplicationRecord
  belongs_to :player1, class_name: :Player
  belongs_to :player2, class_name: :Player
  belongs_to :winner, class_name: :Player, optional: true

  has_many :moves, dependent: :destroy
end
