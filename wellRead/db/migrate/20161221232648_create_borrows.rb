class CreateBorrows < ActiveRecord::Migration[5.0]
  def change
    create_table :borrows do |t|
      t.references :user
      t.string :title
      t.string :friend

      t.timestamps
    end
  end
end
