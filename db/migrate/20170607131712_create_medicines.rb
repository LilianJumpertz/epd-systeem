class CreateMedicines < ActiveRecord::Migration[5.0]
  def change
    create_table :medicines do |t|
      t.string  :generic_name
      t.string  :brand_name
      t.string  :active_ingredient
      t.decimal :dose
      t.string  :dose_unit
      t.string  :symptoms
      t.timestamps
    end
  end
end
