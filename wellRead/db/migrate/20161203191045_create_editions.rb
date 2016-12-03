class CreateEditions < ActiveRecord::Migration[5.0]
  def change
    create_table :editions do |t|
      t.string :title
      t.string :author

    end
  end
end
