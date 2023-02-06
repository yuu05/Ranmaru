Rails.application.routes.draw do
  devise_for :users
  
  root to: 'homes#top'
  get 'home/about', to: 'homes#about'
  resources :users, only: [:index, :show, :edit, :create, :update]
  resources :dog_images, only: [:index, :show, :edit, :create, :update, :destroy]
end