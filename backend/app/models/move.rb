# frozen_string_literal: true

class Move < ApplicationRecord
  belongs_to :player
  belongs_to :board

  validates :cell, presence: true, inclusion: 0..8
  after_save :identify_winner

  private

  def identify_winner
    if Board::WINNING_COMBINATIONS.select { |comb| comb.include?(cell) }.any? do |comb|
         board.moves.where(cell: comb, player: player).count.eql?(3)
       end
      board.update!(winner: player)
    end
  end
end
