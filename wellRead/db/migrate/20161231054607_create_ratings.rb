class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
        t.integer :rating
        t.references :user
        t.references :book

    end
  end
end
