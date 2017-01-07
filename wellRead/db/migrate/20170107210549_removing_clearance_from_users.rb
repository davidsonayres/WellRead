class RemovingClearanceFromUsers < ActiveRecord::Migration[5.0]

  def change
      remove_column :users, :encrypted_password
      remove_column :users, :confirmation_token
      remove_column :users, :remember_token
      
  end
end
