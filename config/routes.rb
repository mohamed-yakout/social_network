Rails.application.routes.draw do
  resources :friendships
  resources :headings
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#index'
end
