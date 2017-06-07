require 'test_helper'

class MedicineTest < ActiveSupport::TestCase
 	def setup
		@patient = Patient.new(first_name: "Test", last_name: "Patient", gender: "man", BSN: "12345678", date_of_birth: "24-12-1980", address: "Dorpsstraat 12A",
			postal_code: "1234AB", place_of_residence: "Amsterdam", phone_number: "06-12345678", email: "test@test.com", insurance_company: "CZ", policy_number: "12345")
			@patient.save
		@medicine = @patient.medicines.build(generic_name: "Ritalin", brand_name: "Ritalin", active_ingredient: "Methylfenidaat", dose: "20", dose_unit: "mg")

	end

	test "should be valid" do
		assert @medicine.valid?
	end

	# validate generic_name

	test "generic name should be <= 50 characters long" do
		@medicine.generic_name = "a" * 51
		assert_not @medicine.valid?
	end

	# validate brand_name

	test "brand name should be present" do
		@medicine.brand_name = " "
		assert_not @medicine.valid?
	end

	test "brand name should be <= 50 characters long" do
		@medicine.brand_name = "a" * 51
		assert_not @medicine.valid?
	end

	# validate active_ingredient

	test "active ingredient should be present" do
		@medicine.active_ingredient = " "
		assert_not @medicine.valid?
	end

	test "active ingredient should be <= 50 characters long" do
		@medicine.active_ingredient = "a" * 51
		assert_not @medicine.valid?
	end

	# validate dose

	test "dose should be present" do
		@medicine.dose = " "
		assert_not @medicine.valid?
	end

	test "dose should be numerical" do
		@medicine.dose = "1" * 7 + "a"
		assert_not @medicine.valid?
	end

	test "dose should be greater than 0" do
		@medicine.dose = 0
		assert_not @medicine.valid?
	end

	# validate dose_unit

	test "dose unit should be present" do
		@medicine.dose_unit = " "
		assert_not @medicine.valid?
	end

	#validate symptoms

		test "symptoms should be <= 100 characters long" do
		@medicine.symptoms = "a" * 101
		assert_not @medicine.valid?
	end

end