class CreateDoctorUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :doctor_users do |t|
      t.text :recommendation
      t.integer :status, null: false, default: 0
      t.datetime :date
      t.references :doctor, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
