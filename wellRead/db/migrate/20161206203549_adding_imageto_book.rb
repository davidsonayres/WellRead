class AddingImagetoBook < ActiveRecord::Migration[5.0]
  def change
      add_column :editions, :image, :string
  end
end
