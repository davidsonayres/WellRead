class AddingReferenceToConversations < ActiveRecord::Migration[5.0]
  def change
      add_reference :conversations, :book
      add_reference :conversations, :users
  end
end
