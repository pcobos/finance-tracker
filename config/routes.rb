Rails.application.routes.draw do
  devise_for :users
  root to: "welcome#index"
  get 'users/my_portfolio', to: 'users#my_portfolio'
end
