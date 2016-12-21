Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'users#index'

resources :my_books do
    resources :reviews
    resources :quotes
    resources :lends
end
resources :books do
    resources :conversations do
        resources :chats
    end
end
resources :users
resources :libraries
resources :editions
resources :sessions

get '/search', to: 'books#search'
get '/search', to: 'my_books#search'
post '/booksearch', to: 'books#searchtobook'
post '/my_booksearch', to: 'my_books#searchtomybook'
post '/edition', to: 'edition#create'
post '/chats/new', to: 'chats#create'


end
