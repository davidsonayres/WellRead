class IdUpdate < ActiveRecord::Migration[5.0]
  def change
      remove_column :my_books, :edition_id_id
      remove_column :my_books, :user_id_id

      add_reference :my_books, :edition
      add_reference :my_books, :user
  end
end
