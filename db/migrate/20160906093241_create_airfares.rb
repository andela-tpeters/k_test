class CreateAirfares < ActiveRecord::Migration[5.0]
  def change
    create_table :airfares do |t|
      t.decimal :dollar_service_charge
      t.string :dollar_tax
      t.references :class, foreign_key: true

      t.timestamps
    end
  end
end
