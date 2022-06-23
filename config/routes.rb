Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :invitations, only: [:update, :destroy]


  resources :musicians do
    resources :invitations, only: [:new, :create, :index]
  end
    resources :reservations, only: [:update, :destroy]


  resources :posts, only: [:update, :destroy]

  resources :orchestras do
    resources :posts, only: [:new, :create]
    resources :invitations, only: [:new, :create, :index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
