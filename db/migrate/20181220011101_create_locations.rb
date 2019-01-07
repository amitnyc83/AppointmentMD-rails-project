class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.integer :zipcode
      t.time :hours_of_operation
      t.integer :physician_id
      t.integer :appointment_id


      t.timestamps
    end
  end
end
