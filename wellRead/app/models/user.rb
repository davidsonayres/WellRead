class User < ApplicationRecord
  include Clearance::User

  has_secure_password

  has_one :library
  has_many :my_books, through: :library
  has_many :reviews, through: :my_books
  has_many :lends
  has_many :quotes
  has_many :conversations
  has_many :chats
  has_many :borrows
  has_many :ratings

  # accepts_nested_attributes_for :borrows

  # validates :password, length: { minimum: 6 }, on: :create
  # validates :password, confirmation: true, on: :create
  # validates :password_confirmation, presence: true, on: :create
  # validates_uniqueness_of :username, :message => ": This username is already registered!"
  # validates_presence_of :username
  # VALID_EMAIL_REGEX =  /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b
  # validates_presence_of :email, format: {with VALID_EMAIL_REGEX}
  # validates_uniqueness_of :email, :message => ": This email is already registered!"

end
