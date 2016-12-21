class CreateLends < ActiveRecord::Migration[5.0]
  def change
    create_table :lends do |t|
      t.references :my_book, foreign_key: true
      t.string :friend

      t.timestamps
    end
  end
end
