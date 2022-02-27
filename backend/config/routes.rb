# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :players, only: :index

      resources :boards, only: [:create] do
        resources :moves, only: %i[index create]
      end
    end
  end
end
