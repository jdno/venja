# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file,
  # see https://guides.rubyonrails.org/routing.html

  get "/pages/*id" => "pages#show", as: :page, format: false

  root to: "pages#show", id: "home"

  resources :habits, param: :uuid, except: %i[show]
  resource :settings, only: %i[edit update]

  # Session management
  resources :passwords, only: %i[create new]
  resource :session, only: [:create]

  resources :users, only: [:create] do
    resource :password, only: %i[create edit update]
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  get "/sign_up" => "users#new", as: "sign_up"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
end
