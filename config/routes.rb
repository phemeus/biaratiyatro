Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :admin do
    root to: "dashboard#index"
    resources :plays
    resources :staffs
    resources :posts
    resources :gallery_images
  end

  resources :plays, only: [:index, :show]
  resources :staffs, only: [:index]
  resources :posts, only: [:index, :show]
  resources :gallery_images, only: [:index]

  # Admin Authentication
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Public Routes
  root "home#index"
end
