# frozen_string_literal: true

class PlayersController < BaseController
  def index
    render json: Player.all
  end
end
