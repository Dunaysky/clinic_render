class RemoveDateFromDoctorUsers < ActiveRecord::Migration[7.0]
  def change 
    remove_column :doctor_users, :date, :datetime
  end
end
