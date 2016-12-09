class ChangingMyBookstoMyBook < ActiveRecord::Migration[5.0]
  def change
      remove_column :my_books, :editions_id
      remove_column :my_books, :users_id

      add_reference :my_books, :edition_id
      add_reference :my_books, :user_id

  end
end
