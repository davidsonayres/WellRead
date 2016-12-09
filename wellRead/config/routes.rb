Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'users#new'

resources :my_books
resources :books
resources :chats
resources :conversations
resources :reviews
resources :users
resources :libraries
resources :editions
resources :sessions

get '/search', to: 'books#search'
get '/search', to: 'my_books#search'
post '/booksearch', to: 'books#searchtobook'
post '/my_booksearch', to: 'my_books#searchtomybook'
get '/my_books', to: 'my_books#searchtomybook'
post '/edition', to: 'edition#create'

end
