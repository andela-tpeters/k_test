class CreatePassengers < ActiveRecord::Migration[5.0]
  def change
    create_table :passengers do |t|
      t.string :picture_url, limit: 40
      t.string :phone, limit: 16
      t.string :passport_no, limit: 15
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
