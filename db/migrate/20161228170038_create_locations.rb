class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|

      t.string :campus
      t.string :year

      t.timestamps
    end
  end
end
