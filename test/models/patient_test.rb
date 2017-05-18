require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  
	def setup
		@patient = Patient.new(first_name: "Test", last_name: "Patient", gender: "man", BSN: "12345678", date_of_birth: "24-12-1980", address: "Dorpsstraat 12A",
			postal_code: "1234AB", place_of_residence: "Amsterdam", phone_number: "06-12345678", email: "test@test.com", insurance_company: "CZ", policy_number: "12345")
	end

	test "should be valid" do
		assert @patient.valid?
	end

	# validate first_name

	test "first name should be present" do
		@patient.first_name = " "
		assert_not @patient.valid?
	end

	test "first name should be <= 50 characters long" do
		@patient.first_name = "a" * 51
		assert_not @patient.valid?
	end

	# validate last_name

	test "last name should be present" do
		@patient.last_name = " "
		assert_not @patient.valid?
	end

	test "last name should be <= 50 characters long" do
		@patient.last_name = "a" * 51
		assert_not @patient.valid?
	end

	# validate gender

	test "gender should be present" do
		@patient.gender = " "
		assert_not @patient.valid?
	end

	test "gender should be in { man, vrouw }" do
		@patient.gender = "other"
		assert_not @patient.valid?
	end

	test "gender should be case-insensitive" do
		@patient.gender = "VrOuw"
		assert @patient.valid?
	end

	# validate BSN

	test "BSN should be present" do
		@patient.BSN = " "
		assert_not @patient.valid?
	end

	test "BSN should be numerical" do
		@patient.BSN = "1" * 7 + "a"
		assert_not @patient.valid?
	end

	test "BSN should be 8 characters long" do
		@patient.BSN = "1" * 7
		assert_not @patient.valid?
	end

	# validate date_of_birth

	test "date_of_birth should be present" do
		@patient.date_of_birth = " "
		assert_not @patient.valid?
	end

	test "date_of_birth should be of format date" do
		@patient.date_of_birth = "11-12"
		assert_not @patient.valid?
	end

	test "date_of_birth should not be in the future" do
		@patient.date_of_birth = Date.today+1.day
		assert_not @patient.valid?
	end

	test "date_of_birth validation should accept valid dates" do
     	valid_dates = %w[24-12-1980 24.12.1980 1980-12-24 1980.12.24 19801224]
     	valid_dates.each do |valid_date|
       		@patient.date_of_birth = valid_date
       		assert @patient.valid?, "#{valid_date.inspect}  should be valid"
    	end
   	end
  
   	test "date_of_birth validation should reject invalid dates" do
    	invalid_dates = %w[12-24-1980 1980-24-12 24121980 12241980 19802412 12.24.1980 1980.24.12 122480 802412 241280 802412]
     	invalid_dates.each do |invalid_date|
       		@patient.date_of_birth = invalid_date
       		assert_not @patient.valid?, "#{invalid_date.inspect} should be invalid"
     	end
   	end

	#validate address

	test "address should be present" do
		@patient.address = " "
		assert_not @patient.valid?
	end

	test "address should be <=50 characters long" do
		@patient.address = "a" * 49 + " " + "1"
		assert_not @patient.valid?
	end

	test "address validation should accept valid addresses" do
		valid_addresses = ["a. @#_-.a 1", "a. 1", "ab 1a-b", "A.B. van Straat 1A-a"]
     	valid_addresses.each do |valid_address|
       		@patient.address = valid_address
       		assert @patient.valid?, "#{valid_address.inspect}  should be valid"
    	end
	end

	test "address validation should reject invalid addresses" do
		valid_addresses = [" a 1", "a  1", "a a"]
     	valid_addresses.each do |valid_address|
       		@patient.address = valid_address
       		assert_not @patient.valid?, "#{valid_address.inspect}  should be invalid"
       	end
    end

	#validate postal_code

	test "postal_code should be present" do
		@patient.postal_code = " "
		assert_not @patient.valid?
	end
	
	test "postal_code should be valid according to the regex rules (exactly 4 numbers)" do
		@patient.BSN = "12345AB"
		assert_not @patient.valid?
	end

	test "postal_code should be valid according to the regex rules (exactly 2 letters)" do
		@patient.BSN = "1234ABC"
		assert_not @patient.valid?
	end

	test "spaces in postal_code should be ignored" do
		@patient.BSN = "1234 AB"
		assert @patient.valid?
	end

	# validate place_of_residence

	test "place_of_residence should be present" do
		@patient.place_of_residence = " "
		assert_not @patient.valid?
	end

	test "place_of_residence should be <= 50 characters long" do
		@patient.place_of_residence = "a" * 51
		assert_not @patient.valid?
	end

	# validate phone_number

	test "phone_number should be between 10 and 13 characters long (lower limit)" do
		@patient.phone_number = "1" * 9
		assert_not @patient.valid?
	end

	test "phone_number should be between 10 and 13 characters long (upper limit)" do
		@patient.phone_number = "1" * 14
		assert_not @patient.valid?
	end

	# validate email

	test "email should be present" do
		@patient.email = " "
		assert_not @patient.valid?
	end

  	test "email validation should accept valid addresses" do
     	valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                           first.last@foo.jp alice+bob@baz.cn]
     	valid_addresses.each do |valid_address|
       		@patient.email = valid_address
       		assert @patient.valid?, "#{valid_address.inspect}  should be valid"
    	end
   	end
  
   	test "email validation should reject invalid addresses" do
    	invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]
     	invalid_addresses.each do |invalid_address|
       		@patient.email = invalid_address
       		assert_not @patient.valid?, "#{invalid_address.inspect} should be invalid"
     	end
   	end
  
   	test "email addresses should be unique" do
    	duplicate_patient = @patient.dup
     	duplicate_patient.email = @patient.email.upcase
     	@patient.save
     	assert_not duplicate_patient.valid?
   	end
  
   	test "email addresses should be saved as lower-case" do
     	mixed_case_email = "Foo@ExAMPle.CoM"
    	@patient.email = mixed_case_email
     	@patient.save
     	assert_equal mixed_case_email.downcase, @patient.reload.email
   	end

	# validate insurance_company

	test "insurance_company should be <= 50 characters long" do
		@patient.insurance_company = "1" * 51
		assert_not @patient.valid?
	end

	# validate policy_number

	test "policy_number should be numerical" do
		@patient.policy_number = "1a"
		assert_not @patient.valid?
	end

	test "policy_number should be <= 20 characters long" do
		@patient.policy_number = "1" * 21
		assert_not @patient.valid?
	end

end