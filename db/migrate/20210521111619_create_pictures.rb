class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.string :property_id
      t.binary :uploaded_picture

      t.timestamps
    end
  end
end
