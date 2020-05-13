Rails.application.routes.draw do
 devise_for :users

 get  "home/about"  => "home#about"
 root "home#index"
 resources :books
 resources :users, only: [:show, :edit, :update, :index]
end
