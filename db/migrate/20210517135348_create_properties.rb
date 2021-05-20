class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.string :location
      t.float :price
      t.string :home_type
      t.string :guest_count
      t.string :bedroom_count
      t.string :bathroom_count
      t.string :room_type
      t.boolean :has_tv
      t.boolean :has_aircon
      t.boolean :has_heater
      t.boolean :has_kitchen
      t.boolean :has_will

      t.timestamps
    end
  end
end
