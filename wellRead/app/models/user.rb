class User < ApplicationRecord
  has_secure_password

  has_one :library
  has_many :my_books, through: :library
  has_many :reviews, through: :my_books
  # lending
  # quotes
  has_many :conversations
  has_many :chats

  # 
  # validates :password, length: { minimum: 8 }, on: :create
  # validates :password, confirmation: true, on: :create
  # validates :password_confirmation, presence: true, on: :create
  #
  # validates :email, uniqueness: true

end
