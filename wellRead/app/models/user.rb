class User < ApplicationRecord

  has_one :library
  has_many :my_books through :library
  has_many :reviews through :my_books
  # lending
  # quotes
  has_many :conversations
  has_many :chats

end
