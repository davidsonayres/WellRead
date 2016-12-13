class AddingRefenceToChats < ActiveRecord::Migration[5.0]
  def change
      add_reference :chats, :conversation
      add_reference :chats, :users
  end
end
