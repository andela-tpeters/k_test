class CreateRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :routes do |t|
      t.string :name
      t.references :airport, foreign_key: true
      t.references :airport, foreign_key: true

      t.timestamps
    end
  end
end
