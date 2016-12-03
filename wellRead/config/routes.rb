Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'users#index'

resources :my_books
resources :books
resources :chats
resources :conversations
resources :reviews
resources :users
resources :libraries
resources :editions

end
