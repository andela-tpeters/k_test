class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.string :booking_ref
      t.references :user, foreign_key: true
      t.references :flight, foreign_key: true
      t.boolean :checked_in

      t.timestamps
    end
  end
end
