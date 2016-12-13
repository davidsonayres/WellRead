class UpdateConversationAttributes < ActiveRecord::Migration[5.0]
  def change
      remove_reference :conversations, :users
      add_reference :conversations, :user
  end
end
