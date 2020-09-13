Rails.application.routes.draw do
  devise_for :users
  
  root to: "welcome#index"
  get 'users/my_portfolio', to: 'users#my_portfolio', as: "my_portfolio"
  get 'search_stock', to: 'stocks#search'

end
