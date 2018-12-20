class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_join_table :appointments do |t|
      t.integer :physician_id
      t.integer :patient_id
      t.integer :location_id

      t.timestamps
    end
  end
end