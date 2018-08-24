Rails.application.routes.draw do

  get 'dashboard/show'
  devise_for :users
  root to: 'pages#home'


  resources :cars do
    resources :bookings, only: [:new, :create, :show]
  end
  resources :bookings, only: :destroy

  resources :dashboard, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
