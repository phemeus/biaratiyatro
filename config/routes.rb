Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :admin do
    root to: "dashboard#index"
    resources :plays
    resources :staffs
    resources :posts
    resources :gallery_images
    resources :backstage_videos
    resources :testimonials
  end

  resources :plays, only: [:index, :show]
  resources :staffs, only: [:index], path: 'hakkimizda'
  resources :posts, only: [:index, :show]
  resources :gallery_images, only: [:index]
  resources :contacts, only: [:index], path: 'iletisim'
  resources :backstage, only: [:index, :show], path: 'backstage'
  resources :subscribers, only: [:create]
  get 'search', to: 'search#index'

  # Admin Authentication
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Public Routes
  root "home#index"
  get '/alive', to: 'application#alive'
end
