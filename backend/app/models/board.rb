# frozen_string_literal: true

class Board < ApplicationRecord
  WINNING_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                          [0, 3, 6], [1, 4, 7], [2, 5, 8],
                          [0, 4, 8], [2, 4, 6]].freeze

  belongs_to :player1, class_name: :Player
  belongs_to :player2, class_name: :Player
  belongs_to :winner, class_name: :Player, optional: true

  has_many :moves, dependent: :destroy
end
