class CreateAircrafts < ActiveRecord::Migration[5.0]
  def change
    create_table :aircrafts do |t|
      t.string :craft_no
      t.integer :capacity

      t.timestamps
    end
  end
end
