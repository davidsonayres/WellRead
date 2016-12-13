class Book < ApplicationRecord

  has_many :conversations
  has_many :my_books, through: :editions
  has_many :editions

  accepts_nested_attributes_for :conversations

end
