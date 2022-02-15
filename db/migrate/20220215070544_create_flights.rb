class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.date :date_flight
      t.string :origin
      t.string :destination
      t.integer :airplane_id

      t.timestamps
    end
  end
end
