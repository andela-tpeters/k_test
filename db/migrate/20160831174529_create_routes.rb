class CreateRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :routes do |t|
      t.string :name
      t.integer :departure_id, references: :airport, foreign_key: true
      t.integer :arrival_id, references: :airport, foreign_key: true

      t.timestamps
    end
  end
end
