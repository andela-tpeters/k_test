
class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.references :flight, foreign_key: true
      t.references :booking, foreign_key: true
      t.datetime :payment_date
      t.references :airfare, foreign_key: true
      t.string :transaction_ref
      t.integer :status

      t.timestamps
    end
  end
end
