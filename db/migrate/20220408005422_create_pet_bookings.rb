class CreatePetBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :pet_bookings do |t|
      t.date :start_date
      t.date :end_date
      t.integer :cage_num
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
