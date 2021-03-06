Rails.application.routes.draw do
 devise_for :users
 root "homes#home"
 get "/home/about" => "homes#about"
 resources :users, only: [:index, :show, :edit, :update]
 resources :books do
  resources :book_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
 end
end