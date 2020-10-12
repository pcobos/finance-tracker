Rails.application.routes.draw do
  devise_for :users
  
  root to: "welcome#index"
  get 'users/my_portfolio', to: 'users#my_portfolio', as: "my_portfolio"
  get 'users/friends', to: 'users#friends', as: "friends"
  get 'search_stock', to: 'stocks#search'
  get 'search_users', to: 'users#search'

  resources :user_stocks, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]
end
