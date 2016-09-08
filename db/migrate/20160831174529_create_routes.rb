class CreateRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :routes do |t|
      t.string :name
      t.references :departure
      t.references :arrival

      t.timestamps
    end
  end
end
