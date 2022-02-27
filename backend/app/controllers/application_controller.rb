# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActionController::RoutingError, with: :unprocessable_entity
  rescue_from ActiveRecord::RecordNotFound, with: :unprocessable_entity
  rescue_from Exception, with: :unprocessable_entity

  private

  def unprocessable_entity(exception)
    render json: { errors: exception.message }, status: :unprocessable_entity
  end
end
