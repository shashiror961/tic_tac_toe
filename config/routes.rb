Rails.application.routes.draw do
  resources :games, only: [:index, :create, :show, :destroy] do
    resources :moves, only: [:create]
  end

  root 'games#index'
end
