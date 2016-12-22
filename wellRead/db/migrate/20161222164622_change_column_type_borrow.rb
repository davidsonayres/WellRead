class ChangeColumnTypeBorrow < ActiveRecord::Migration[5.0]
  def change
      remove_column :borrows, :friend
      remove_column :borrows, :title

      add_column :borrows, :friend, :text
      add_column :borrows, :title, :text
  end
end
