Rails.application.routes.draw do

  root 'books#top'
  devise_for :users
  resources :users, only: [:show, :edit, :update, :index]
  get 'home/about' => 'books#about'
  resources :books

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
