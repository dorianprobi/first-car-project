class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :status
      t.date :starts_at
      t.date :ends_at
      t.references :user_id
      t.references :car_id

      t.timestamps
    end
  end
end
