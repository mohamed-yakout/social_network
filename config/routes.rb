Rails.application.routes.draw do
  resources :friendships
  resources :headings
  resources :users do
    member do
      get 'headings'
      get 'home'
      get 'shortest_path/:user_destination_id', to: 'users#shortest_path'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#index'
end
