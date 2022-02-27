# frozen_string_literal: true

module Api
  module V1
    class PlayersController < Api::BaseController
      def index
        render json: Player.all
      end
    end
  end
end
