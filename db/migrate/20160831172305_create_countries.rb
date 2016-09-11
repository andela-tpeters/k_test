class CreateCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :iso_code
      t.string :country_code
      t.string :currency
      t.string :currency_symbol
      t.string :exchange_rate

      t.timestamps
    end
  end
end
