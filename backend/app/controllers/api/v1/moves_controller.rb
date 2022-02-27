# frozen_string_literal: true

module Api
  module V1
    class MovesController < Api::BaseController
      before_action :set_board

      def create
        move = @board.moves.new(move_params)
        if move.save
          render json: { winner: @board.reload.winner }
        else
          render json: move.errors, status: :unprocessable_entity
        end
      end

      private

      def set_board
        @board = Board.find(params[:board_id])
      end

      def move_params
        params.require(:move).permit(:player_id, :cell)
      end
    end
  end
end
