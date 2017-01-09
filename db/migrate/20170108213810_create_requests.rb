class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.text :description
      t.string :contact
      t.references :seller
      t.references :buyer
      t.references :book, foreign_key: true
      t.timestamps
    end
  end
end
