class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.date :departure_date
      t.time :departure_time
      t.datetime :arrival_date
      t.references :aircraft, foreign_key: true
      t.references :route, foreign_key: true

      t.timestamps
    end
  end
end
