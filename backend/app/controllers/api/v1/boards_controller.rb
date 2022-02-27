# frozen_string_literal: true

class BoardsController < BaseController
  before_action :set_players, only: :new

  def new
    @board = Board.new(player1: @player1, player2: @player2)
    if @board.save
      render json: @board
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  private

  def set_players
    @player1 = Player.find_or_create_by!(name: params[:player1])
    @player2 = Player.find_or_create_by!(name: params[:player2])
  end
end
