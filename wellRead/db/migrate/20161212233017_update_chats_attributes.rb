class UpdateChatsAttributes < ActiveRecord::Migration[5.0]
  def change
      remove_reference :chats, :users
      add_reference :chats, :user
  end
end
