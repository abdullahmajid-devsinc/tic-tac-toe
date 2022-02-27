# frozen_string_literal: true

module Api
  module V1
    class BoardsController < Api::BaseController
      def create
        ActiveRecord::Base.transaction do
          set_players
          board = Board.create!(player1: @player1, player2: @player2)
          render json: board
        end
      rescue ActiveRecord::RecordInvalid => e
        render json: e.message, status: :unprocessable_entity
      end

      private

      def set_players
        @player1 = Player.find_or_create_by(name: params[:player1])
        @player2 = Player.find_or_create_by(name: params[:player2])
      end
    end
  end
end
