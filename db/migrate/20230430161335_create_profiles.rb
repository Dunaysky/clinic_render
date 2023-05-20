class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.string :phone_number, null: false
      t.references :related_to, polymorphic: true

      t.timestamps
    end
    add_index :profiles, :phone_number, unique: true
  end
end
