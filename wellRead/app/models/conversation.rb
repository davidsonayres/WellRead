class Conversation < ApplicationRecord

  belongs_to :user
  belongs_to :book
  has_many :chats

  accepts_nested_attributes_for :chats

end
