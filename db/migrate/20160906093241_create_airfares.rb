class CreateAirfares < ActiveRecord::Migration[5.0]
  def change
    create_table :airfares do |t|
      t.references :route, foreign_key: true
      t.decimal :service_charge
      t.string :tax
      t.references :class, foreign_key: true

      t.timestamps
    end
  end
end
