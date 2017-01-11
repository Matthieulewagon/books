class AddNetworksToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :facebook, :string
    add_column :users, :whatsapp, :string
  end
end
