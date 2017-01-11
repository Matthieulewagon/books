class AddNetworksToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :facebook, :string
    add_column :requests, :whatsapp, :string
    add_column :requests, :gsm, :integer
    add_column :requests, :email, :string
  end
end
