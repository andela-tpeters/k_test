class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :flight, foreign_key: true
      t.references :passenger, foreign_key: true
      t.datetime :booking_date
      t.references :airfare, foreign_key: true
      t.string :transaction_ref
      t.integer :status

      t.timestamps
    end
  end
end
