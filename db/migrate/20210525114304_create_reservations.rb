class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.integer :property_id, foreign_key: true
      t.integer :user_id, foreign_key: true
      t.boolean :has_finished

      t.timestamps
    end
  end
end
