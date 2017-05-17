class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :gender
      t.integer :BSN
      t.date    :date_of_birth
      t.string  :address
      t.string  :postal_code
      t.string  :place_of_residence
      t.string  :phone_number
      t.string  :email
      t.string  :insurance_company
      t.string  :policy_number

      t.timestamps
    end
  end
end