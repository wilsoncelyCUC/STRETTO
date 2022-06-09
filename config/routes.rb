Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :musicians do
    resources :invitations, only: [:new, :create]
  end

  resources :posts, only: [:update, :destroy]

  resources :orchestras do
    resources :posts, only: [:new, :create]
    resources :invitations, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
