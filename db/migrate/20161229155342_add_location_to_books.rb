class AddLocationToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :campus, :string
    add_column :books, :year, :string
  end
end
