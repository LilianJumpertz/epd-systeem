class AddMedicineToPatients < ActiveRecord::Migration[5.0]
  def change
    add_reference :medicines, :patient, index: true
  end
end
